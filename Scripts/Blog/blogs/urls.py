from django.urls import path

from .views import BlogDetailView
from user_operations.views import CommentView

app_name='blogs'
urlpatterns=[
    path('<int:blog_pk>/',BlogDetailView.as_view(),name='blog_detail'),
    path('comment/',CommentView.as_view(),name='comment'),   
]