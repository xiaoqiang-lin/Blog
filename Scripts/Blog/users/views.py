from random import Random


from django.shortcuts import render,redirect
from django.contrib import auth
from django.core.paginator import Paginator
from django.core.exceptions import ObjectDoesNotExist
from django.views import View
from django.conf import settings
from django.db.models import Q
from django.contrib.auth.hashers import check_password,make_password
from django.contrib.contenttypes.models import ContentType

from  .forms import Loginform,RegisterForm,ForgetPwdForm,ModifyPwdForm
from users.models import UserProfile,EmailVerifyReord
from user_operations.forms import CommentForm
from blogs.models import Blog,Category,RandImg
from utils.send_email import send_emails

# Create your views here.
class CustomBackend:
    def authenticate(self,request,username=None,password=None):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
        except ObjectDoesNotExist as e:
            return None
        if user.check_password(password):
            return user
        else:
            return None    
        

    def get_user(self,user_id):
        try:
            return UserProfile.objects.get(pk=user_id)
        except UserProfile.DoesNotExist:
            return None           


def index(request):
    allBlogs=Blog.objects.all()
    context=blog_display(request,allBlogs)
    return render(request,'index.html',context)

def blog_display(request,allBlogs):

    ####分页
    blog=ContentType.objects.get_for_model(Blog)
    paginator=Paginator(allBlogs,settings.PER_PAGE_BLOGS)
    page_num=request.GET.get('page',1)###获取get请求中的页码参数，
    pageObj=paginator.get_page(page_num)
    page_range=[x for x in range(int(page_num)-2,int(page_num)+3) if 0 < x <=paginator.num_pages]
    
    if page_range[0] - 1 >= 2:
        page_range.insert(0,"...")
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append("...")
    
    if page_range[0] != 1:
        page_range.insert(0,1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)  

    context = {}
    context['allBlogs'] = allBlogs.order_by('-read_nums')[:5]
    context['blogs'] = pageObj.object_list
    context['pages'] = pageObj.number
    context['page_range'] = page_range
    # context['img']=RandImg.objects.get(pk=Random().randint(1,5))
    context['allCategories']=Category.objects.all()
    return context

class LeaveMsgView(View):
    def get(self,request):
        comment_form=CommentForm()
        return render(request,'gbook.html',{'comment_form':comment_form})

class RegisterView(View):
    def get(self,request):
        register_form=RegisterForm()
        return render(request,'register.html',{'register_form':register_form})

    def post(self,request):
        register_form=RegisterForm(request.POST)
        if register_form.is_valid():
            if UserProfile.objects.filter(email=request.POST['email']):
                return render(request,'register.html',{'err_msg':'该用户已经存在'})
            user=UserProfile.objects.create(username=request.POST.get('email'),email=request.POST.get('email'),
                password=make_password(request.POST.get('password')))
            user.save()
            send_emails(user.email,'register')
            return render(request,'login.html')
        else:
            return render(request,'register.html',{'register_form':register_form})

class ActiveView(View):
    def get(self,request,active_code):
        all_records =EmailVerifyReord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email=record.email
                user=UserProfile.objects.get(email=email)
                user.is_active=True
                user.save()
            return render(request,'login.html')
        else:
            return render(request, 'active_fail.html')

class LoginView(View):
    def get(self,request):
        return render(request,'login.html')

    def post(self,request):
        login_form = Loginform(request.POST)
        if login_form.is_valid():
            user = CustomBackend().authenticate(request,username=request.POST.get('username',''),password=request.POST.get('password',''))
            if user is not None:
                if user.is_active: 
                    auth.login(request,user)
                    return redirect('index')
                else:
                    return render(request,'login.html',{'err_msg':'该用户未激活'})
            else:
                return render(request,'login.html',{'err_msg':'用户名或密码不正确'})
        else:
            return render(request,'login.html',{'login_form':login_form})     

class ForgetPwdView(View):
    def get(self,request):
        forgetpwd_form=ForgetPwdForm()
        return render(request,'forget_pwd.html',{'forgetpwd_form':forgetpwd_form})

    def post(self,request):
        forgetpwd_form=ForgetPwdForm(request.POST)
        if forgetpwd_form.is_valid():
            send_emails(request.POST['email'],'forget_pwd')
            return render(request,'send_email_success.html')
        else:
            return render(request,'forget_pwd.html',{'forgetpwd_form':forgetpwd_form})

class ResetPwdView(View):
    def get(self,request,active_code):

        #Because the active_code generated at random,there are possible the same record.
        all_records =EmailVerifyReord.objects.filter(code=active_code)
        ## I think it is not proper here....
        if all_records:
            for record in all_records:
                email=record.email  
            return render(request,'resetpwd.html',{'email':email})
        else:
            return render(request, 'resetpwd_fail.html')
        return render(request, 'login.html')

class ModifyPwdView(View):
    def post(self,request):
        modifypwd_form =ModifyPwdForm(request.POST)
        email=request.POST['email']
        if modifypwd_form.is_valid():
            if request.POST['password'] != request.POST['confirm_password']:
                return render(request,'password_reset.html',{'email':email,'err_msg':'密码不一致'})
            user = UserProfile.objects.get(email=email)
            user.password=make_password(request.POST['password'])
            user.save()
            return render(request,'login.html')
        else:
            return render(request,'resetpwd.html',{'email':email,'modifypwd_form':modifypwd_form})