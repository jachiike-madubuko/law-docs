from django.http import JsonResponse
from django.shortcuts import render

from .utils import *


def index(request):
    """
        def doc_edit(request):
        doc_edit will create a document editting environment for lawyers to edit their
        documents by adding doc pieces
    """


    return render(request, 'attorney/home.html')


def contact(request):
    return render(request, 'attorney/basic.html',{'content':['If you would like to contact us, please email the team at.','odeajustin@gmail.com, jachi36@gmail.com, and waylon@msulaunchpad.org']})


def suggest_piece(request):
    piece_list = []
    starts_with = ''
    if request.method == 'GET':
        starts_with = request.GET['suggestion']

        piece_list = list(get_pieces_list(8, starts_with))
    # create html, that lists the docPieces as buttons
    # look up render functions with JSON instead of html
    return JsonResponse(piece_list, safe=False)
