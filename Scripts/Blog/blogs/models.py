from random import Random


from django.db import models
from django.conf import settings

from ckeditor_uploader.fields import RichTextUploadingField


# Create your models here.
class Blog(models.Model):
    blog_title=models.CharField(max_length=50,verbose_name='标题')
    blog_content=RichTextUploadingField('内容')
    author=models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.DO_NOTHING,verbose_name='作者')
    category=models.ForeignKey('Category',on_delete=models.DO_NOTHING,verbose_name='分类')
    comment_nums=models.IntegerField(default=0,verbose_name='评论量')
    favor_nums=models.IntegerField(default=0,verbose_name='收藏量')
    read_nums=models.IntegerField(default=0,verbose_name='阅读量')
    like_nums=models.IntegerField(default=0,verbose_name='点赞量')
    posted_time=models.DateTimeField(auto_now_add=True,verbose_name='发布时间')
    last_modified_time=models.DateTimeField(auto_now=True,verbose_name='最近修改时间')

    class Meta:
        ordering=['-posted_time']
        verbose_name='博客'
        verbose_name_plural=verbose_name

    def __str__(self):
        return self.blog_title



class RandImg(models.Model):
    rand_img=models.ImageField(max_length=100,upload_to='random_imgs/%Y/%m',verbose_name='博客配图')
    posted_time=models.DateTimeField(auto_now_add=True,verbose_name='上传时间')

    class Meta:
        verbose_name='博客配图'
        verbose_name_plural=verbose_name


class Category(models.Model):
    category_name=models.CharField(max_length=15,verbose_name='分类')
    
    def __str__(self):
        return self.category_name

    class Meta:
        verbose_name='分类'
        verbose_name_plural=verbose_name


