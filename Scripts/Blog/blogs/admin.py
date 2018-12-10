from django.contrib import admin

from .models import Blog,Category,RandImg
# Register your models here.
@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display =['blog_title','author','category','comment_nums','favor_nums','posted_time','last_modified_time']
    search_fields = ['blog_title','category']
    list_filter =['posted_time']

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display=['id','category_name']

@admin.register(RandImg)
class CategoryAdmin(admin.ModelAdmin):
    list_display=['id','rand_img','posted_time']