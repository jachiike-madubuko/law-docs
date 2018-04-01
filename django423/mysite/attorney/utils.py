'''
This file  contains helper function, for search queries, and data preparation before
Views.py uses the data
'''

'''
Useful ORM queries

When searching based on a relationship use
filter(person__firstname__istartswith='d')
filter(legal__name__istartswith='d')
to find the relationship involving a certain person

'''
from attorney.models import Piece


def get_pieces_list(userID=0, max_results=0, starts_with=''):
    piece_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.objects.all()
    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        piece_list = Piece.objects.filter(name__istartswith=starts_with).values('name', 'type', 'piecetype')
        print(piece_list)

    if piece_list and max_results > 0:
        if piece_list.count() > max_results:
            piece_list = piece_list[:max_results]

    return piece_list


def get_documents_list(max_results=0, starts_with=''):
    piece_list = []
    if starts_with:
        piece_list = Piece.objects.filter(name__istartswith=starts_with)

    if piece_list and max_results > 0:
        if piece_list.count() > max_results:
            piece_list = piece_list[:max_results]

    return piece_list
