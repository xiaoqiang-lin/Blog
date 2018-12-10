from django.contrib import admin
from .models import UserFavor,UserMessage,UserComment,UserVisit

# Register your models here.
@admin.register(UserFavor)
class UserFavorAdmin(admin.ModelAdmin):
    list_display=['user','blog','favor_created_time']

@admin.register(UserMessage)
class UserMessageAdmin(admin.ModelAdmin):
    list_display=['user','message_send_time','has_read']

@admin.register(UserComment)
class UserCommentAdmin(admin.ModelAdmin):
    list_display=['user','blog','root','parent_id','comment_time']

@admin.register(UserVisit)
class UserVisitAdmin(admin.ModelAdmin):
    list_display=['user','click_nums']