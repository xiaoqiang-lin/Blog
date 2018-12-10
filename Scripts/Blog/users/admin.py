from django.contrib import admin
from .models import UserProfile,EmailVerifyReord,Banner

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display=['username','password']

@admin.register(EmailVerifyReord)
class EmailVerifyReordAdmin(admin.ModelAdmin):
    list_display=['code','email','send_type','send_time']
    search_fields=['code','email']
    list_filter=['send_time',]


@admin.register(Banner)
class BannerAdmin(admin.ModelAdmin):
    list_display=['title','img','index','add_time','url']
    search_fields=['title','index','url']
    list_filter=['add_time',]
