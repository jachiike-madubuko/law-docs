from django.shortcuts import render


def index(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """


    return render(request, 'attorney/home.html')











def contact(request):
    return render(request, 'attorney/basic.html',{'content':['If you would like to contact us, please email the team at.','odeajustin@gmail.com, jachi36@gmail.com, and waylon@msulaunchpad.org']})