from django.views import View



from blogs.models import Blog,RandImg,Category
from counter.models import Counter

class IncludingView(View):
    def get(self,request):
        

        context={}
        
        context['allCategories']=Category.objects.all()
        return render(request,'including.html',context)


