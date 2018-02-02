from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, 'attorney/home.html')

def contact(request):
    return render(request, 'attorney/basic.html',{'content':['If you would like to contact us, please email the team at.','odeajustin@gmail.com, jachi36@gmail.com, and waylon@msulaunchpad.org']})