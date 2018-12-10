from django.shortcuts import render,get_object_or_404,render_to_response
from django.views import View
from django.contrib.contenttypes.models import ContentType

from .models import Blog
from blogs.models import Category

from user_operations.forms import CommentForm
from user_operations.models import UserComment 
# Create your views here.

class BlogDetailView(View):
    def get(self,request,blog_pk):
        blogObj=get_object_or_404(Blog,pk=blog_pk)
        if not request.COOKIES.get('blog%shas_read' %blog_pk,''):
            blogObj.read_nums += 1
            blogObj.save()
        context={}
        context['comment_form']=CommentForm()
        context['blogObj']=blogObj
        context['previous_blog']=Blog.objects.filter(posted_time__gt=blogObj.posted_time).last()###获取上一篇博客
        context['next_blog']=Blog.objects.filter(posted_time__lt=blogObj.posted_time).first()###获取下一篇博客
        context['allCategories']=Category.objects.all()
        context['user_comment_objs']=UserComment.objects.filter(blog__pk=blog_pk,parent=None)
        response=render(request,'blog_detail.html',context)
        response.set_cookie('blog%shas_read' %blog_pk,True)
        return response

    


