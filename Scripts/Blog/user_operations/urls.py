from django.urls import path
from .views import LikeView

app_name='operation'

urlpatterns=[
    path('like/',LikeView.as_view(),name='like')
    
]