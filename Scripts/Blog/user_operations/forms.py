from django import forms
from ckeditor.widgets import CKEditorWidget

class CommentForm(forms.Form):
    comment_text=forms.CharField(widget=CKEditorWidget(config_name='comment_ckeditor'),
        error_messages={'required':'评论内容不能为空'})

    def sync_submit(self,request,blog_pk):
        data={}
        comment_form=CommentForm(request.POST)
        if  comment_form.is_valid():
            user_comment_obj=UserComment()
            user_comment_obj.user=request.user
            user_comment_obj.blog=Blog.objects.get(pk=blog_pk)
            user_comment_obj.comment_content=request.POST['comment_text']
            user_comment_obj.comment_nums += 1
            user_comment_obj.save()



            data['status']='SUCCESS'
            data['username']=str(request.user)
            data['coment_time']=user_comment_obj.comment_time.strftime("%Y-%m-%d %H:%M:%S")
            data['comment_content']=request.POST['comment_text']
        else:
            data['status']='ERROR'
        return JsonResponse(data)