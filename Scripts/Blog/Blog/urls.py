"""Blog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include,re_path
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve


from users.views import index,LeaveMsgView,LoginView,RegisterView,ActiveView,ForgetPwdView,ResetPwdView,ModifyPwdView
from user_operations.views import LikeView



urlpatterns = [
    path('admin/', admin.site.urls),
    path('ckeditor',include('ckeditor_uploader.urls')),
    path('captcha/',include('captcha.urls')),
    path('',index,name='index'),
    path('gbook/',LeaveMsgView.as_view(),name='gbook'),
    path('blogs/',include('blogs.urls','blogs')),
    re_path(r'^media/(?P<path>.*)$',serve,{'document_root':settings.MEDIA_ROOT}),
    path('login/',LoginView.as_view(),name='login'),
    path('register/',RegisterView.as_view(),name='register'),
    path('active/<str:active_code>',ActiveView.as_view(),name='active'),
    path('forgetpwd/',ForgetPwdView.as_view(),name='forget_pwd'),
    path('reset/<str:active_code>',ResetPwdView.as_view(),name='reset_pwd'),
    path('modifypwd/',ModifyPwdView.as_view(),name='modify_pwd'),
    path('operation/',include('user_operations.urls','operation')),
]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT) 