from django.shortcuts import render
from django.views import View
from django.db.models.fields import exceptions
from django.http import JsonResponse


from .forms import CommentForm
from user_operations.models import UserComment,UserFavor
from blogs.models import Blog
from users.models import UserProfile


# Create your views here.
class CommentView(View):
    def post(self,request):
        data={}
        comment_form=CommentForm(request.POST)
        if  comment_form.is_valid():
            if not request.POST.get('pid'):
                comment_obj=UserComment.objects.create(blog_id=request.POST.get('blog_pk'),
                    user=request.user,comment_content=request.POST.get('comment_text'))
            else:
                comment_obj=UserComment.objects.create(blog_id=request.POST.get('blog_pk'),
                    user=request.user,comment_content=request.POST.get('comment_text'),parent_id=request.POST.get('pid'))
                comment_obj.root=comment_obj.parent.root if not comment_obj.parent.root is None else comment_obj.parent
            comment_obj.save()
            data['status']='SUSCCESS'
            data['username']=comment_obj.user.username
            data['comment_time']=comment_obj.comment_time.strftime('%Y-%m-%d %H:%M:%S')
            data['comment_content']=comment_obj.comment_content
            data['root_pk']=request.POST.get('pid')
        else:
            data['status']='ERROR'
            data['err_msg']=comment_form.errors
        return JsonResponse(data)


class LikeView(View):
    def get(self,request):
        if not request.user.is_authenticated:
            return JsonResponse({'status':'ERROR','msg':'用户未登录'})
        else:
            blog=Blog.objects.get(pk=request.GET.get('blog_pk'))
            obj,created=UserFavor.objects.get_or_create(blog=blog,user=request.user)
            if obj.is_thumb_up:
                blog.like_nums -=1
                obj.is_thumb_up=False
            else:
                blog.like_nums +=1
                obj.is_thumb_up=True
            blog.save()
            obj.save()
            return JsonResponse({'status':'SUSCCESS','like_nums':blog.like_nums})

