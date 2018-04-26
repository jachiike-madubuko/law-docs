import os

from django.core.files import File
from django.http import JsonResponse
from django.shortcuts import render

from mysite.settings import TEMPLATE_DIRS
from .utils import *


def user(request):
    if request.method == 'GET':
        user_login_info = login(request.GET, request.META['REMOTE_ADDR'])
        print(user_login_info)
    return JsonResponse(user_login_info, safe=False)


def new_user(request):
    if request.method == 'GET':
        request.GET['suggestion']
        new_user_info = {'userID': 5, 'nextURL': 'tight'}

    return JsonResponse(new_user_info, safe=False)

def index(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """

    return render(request, 'attorney/homepage.html')


def dashboard(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """

    return render(request, 'attorney/dashboard.html')


def map(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """

    return render(request, 'attorney/map.html')


def my_dashboard(request):
    doc_list = []
    doc_list = list(get_my_documents_list(request.META['REMOTE_ADDR']))

    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """

    return JsonResponse(doc_list, safe=False)
def contact(request):
    return render(request, 'attorney/basic.html', {
        'content': ['If you would like to contact us, please email the team at.',
                    'odeajustin@gmail.com, jachi36@gmail.com, and waylon@msulaunchpad.org']})


def suggest_piece(request):
    piece_list = []
    starts_with = ''
    if request.method == 'GET':
        starts_with = request.GET['suggestion']

        piece_list = list(get_pieces_list(8, starts_with))
    # create html, that lists the docPieces as buttons
    # look up render functions with JSON instead of html
    return JsonResponse(piece_list, safe=False)


def new_piece(request):
    piece_list = []
    starts_with = ''
    if request.method == 'POST':
        entry = request.POST['docPiece']
        userID = 0
        create_piece(userID, entry)

def final_doc(request):
    print('entering final doc function')
    if request.method == 'GET':
        doc = request.GET['doc']  # doc =  list of the sorted doc pieces
        name = request.GET['title']

        html = "<html><body>" + doc + "</body></html>"

        path = os.path.join(TEMPLATE_DIRS[0], 'doc_view.html')
        with open(path, 'w') as f:
            myfile = File(f)
            myfile.write(html)

        from filestack import Client
        client = Client('AfEkWPbqOQYqKQt291D7dz')
        params = {'mimetype': 'application/pdf'}
        new_filelink = client.upload(filepath=myfile.name)
        # metadata = filelink.get_metadata()
        #
        # print(filelink.url)
        # print(metadata)

        # conversion = filelink.filetype_conversion(format='pdf')
        # new_filelink = conversion.store()
        new_metadata = new_filelink.get_metadata()
        print("CONVERT")
        print(new_filelink.url)
        print(new_metadata)
        # create_document(new_filelink.url)

        return JsonResponse({'url': new_filelink.url, 'path': myfile.name}, safe=False)

        # screenshot = client.url_screenshot('https://www.example.com', width=100, height=100, agent="desktop")
        # filelink = screenshot.store()
        # new_path = settings.MEDIA_ROOT + name
        # #now render this has a filestack view
        # return HttpResponse(html)
        # return render(request, myfile.name)
        # pass concatentate doc pieces to the file_stack and convert to pdf
        # upload, create function in util that saves the url as a new document
        # send the file views with watermark


def my_map(request):
    # print('entering final doc function')
    # if request.method == 'GET':
    #     doc = request.GET['doc']  # doc =  list of the sorted doc pieces
    #     name = request.GET['title']
    #
    #     html = "<html><body>" + doc + "</body></html>"
    #
    #     path = os.path.join(TEMPLATE_DIRS[0], 'doc_view.html')
    #     with open(path, 'w') as f:
    #         myfile = File(f)
    #         myfile.write(html)
    #
    #     from filestack import Client
    #     client = Client('AfEkWPbqOQYqKQt291D7dz')
    #     params = {'mimetype': 'application/pdf'}
    #     new_filelink = client.upload(filepath=myfile.name)
    #     # metadata = filelink.get_metadata()
    #     #
    #     # print(filelink.url)
    #     # print(metadata)
    #
    #     # conversion = filelink.filetype_conversion(format='pdf')
    #     # new_filelink = conversion.store()
    #     new_metadata = new_filelink.get_metadata()
    #     print("CONVERT")
    #     print(new_filelink.url)
    #     print(new_metadata)
    #     # create_document(new_filelink.url)
    piece_list = dict()
    return JsonResponse(piece_list, safe=False)
