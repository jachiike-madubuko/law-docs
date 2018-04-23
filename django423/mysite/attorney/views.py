from django.http import JsonResponse
from django.shortcuts import render
from filestack import Client, Filelink

from .utils import *

client = Client("AfEkWPbqOQYqKQt291D7dz")

# if you already have a handle, you can initialize a Filelink
filelink = Filelink("YOUR_HANDLE", apikey="API_KEY")


def index(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """

    return render(request, 'attorney/home.html')


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
        print(piece_list)
    # create html, that lists the docPieces as buttons
    # look up render functions with JSON instead of html
    return JsonResponse(piece_list, safe=False)


def filestack_doc(request):
    if request.method == 'GET':
        doc = request.GET['doc']  # doc contains a list of the doc pieces in the order shown on the editor
    print(doc)

    # pass concatentate doc pieces to the file_stack and convert to pdf

    params = {'mimetype': 'application/html'}
    new_filelink = client.upload(filepath=request.path, params=params)
    print("NEW FILE")
    print(new_filelink.url)

    create_document(new_filelink.url)
    # upload, create function in util that saves the url as a new document
    # send the file views with watermark
