from django.db import models
from blogs.models import Blog

from ckeditor_uploader.fields import RichTextUploadingField

from users.models import UserProfile

# Create your models here.
# 用户收藏
# 
class UserOperation(models.Model):
    user=models.ForeignKey(UserProfile,on_delete=models.DO_NOTHING,verbose_name='用户')
    class Meta:
        abstract=True

class UserFavor(UserOperation):
    blog=models.ForeignKey(Blog,on_delete=models.DO_NOTHING,verbose_name='博客')
    is_thumb_up=models.BooleanField(default=False,verbose_name='点赞与否')
    favor_created_time=models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name='用户收藏'
        verbose_name_plural=verbose_name

###用户消息
class UserMessage(UserOperation):
    message_content=models.CharField(max_length=500,verbose_name='消息内容')
    message_send_time=models.DateTimeField(auto_now_add=True,verbose_name='发送时间')
    message_nums=models.IntegerField(verbose_name='消息量')
    has_read=models.BooleanField(default=False,verbose_name='是否已读')

    class Meta:
        verbose_name='用户消息'
        verbose_name_plural=verbose_name


###用户评论
class UserComment(UserOperation):
    blog=models.ForeignKey(Blog,on_delete=models.DO_NOTHING,verbose_name='博客')
    root=models.ForeignKey('self',related_name='root_comment',on_delete=models.CASCADE,null=True,verbose_name="根评论")
    parent=models.ForeignKey('self',related_name='parent_comment',on_delete=models.DO_NOTHING,null=True,blank=True,verbose_name="回复")
    reply_whom=models.ForeignKey('self',related_name='reply_comment',on_delete=models.DO_NOTHING,null=True,blank=True,verbose_name="回复对象")
    comment_content=RichTextUploadingField(verbose_name='用户评论')
    comment_time=models.DateTimeField(auto_now_add=True,verbose_name='评论时间')

    class Meta:
        ordering=['-comment_time']
        verbose_name='用户评论'
        verbose_name_plural=verbose_name

    def __str__(self):
        return self.comment_content

###用户访问
class UserVisit(UserOperation):
    click_nums=models.IntegerField(verbose_name='阅读')
    class Meta:
        verbose_name='用户访问'
        verbose_name_plural=verbose_name