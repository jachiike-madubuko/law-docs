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
from attorney.models import Document, Piece, InState, ForState, Own



def get_pieces_list(max_results=0, starts_with=''):
    piece_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        piece_list = Piece.legals.filter(name__istartswith=starts_with).values('legalID', 'name', 'type', 'piecetype')

    if piece_list and max_results > 0:
        if piece_list.count() > max_results:
            piece_list = piece_list[:max_results]

    return piece_list


def get_documents_list(max_results=0, starts_with=''):
    document_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        document_list = Document.legals.filter(name__istartswith=starts_with).values('name', 'type', 'piecetype')
        print(document_list)

    if document_list and max_results > 0:
        if document_list.count() > max_results:
            document_list = document_list[:max_results]

    return document_list


def get_my_pieces_list(userID=0, max_results=0, starts_with=''):
    piece_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    # x[0]['personID'] yeilds the ID

    if starts_with:
        # searches users owned legals for ones that start with...
        piece_list = my_pieces.filter(legal__name__istartswith=starts_with).values('legal__name', 'legal__content')

    if piece_list and max_results > 0:
        if piece_list.count() > max_results:
            piece_list = piece_list[:max_results]

    return piece_list


def get_my_documents_list(userID, max_results=0, starts_with=''):
    piece_list = []
    if starts_with:
        piece_list = Piece.legals.filter(name__istartswith=starts_with)

    if piece_list and max_results > 0:
        if piece_list.count() > max_results:
            piece_list = piece_list[:max_results]

    return piece_list
    document_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        document_list = Document.objects.filter(name__istartswith=starts_with).values('name', 'type', 'piecetype')
        print(document_list)

    if document_list and max_results > 0:
        if document_list.count() > max_results:
            document_list = document_list[:max_results]
    return document_list


def by_states(st, lawyer=False, client=False, document=False):
    state_stack = []
    find_state_by_ppl = InState.people_states.all()
    find_state_by_legal = ForState.legals_states.all()
    if (lawyer):
        find_state_by_ppl.filter()

    if (document):
        find_state_by_legal.filter()

    if (client):
        find_state_by_ppl.filter()


def by_tag(tag, lw, lawyer=False, client=False, document=False):
    state_stack = []
    if (lawyer):
        find_state_by_ppl.filter()

    if (document):
        find_state_by_legal.filter()

    if (client):
        find_state_by_ppl.filter()


def by_legal(legal, lawyer=False, client=False, document=False):
    state_stack = []
    own_legal
    buy_legal
    use_legal
    view_legal
    if (lawyer):
        find_state_by_ppl.filter()

    if (document):
        find_state_by_legal.filter()

    if (client):
        find_state_by_ppl.filter()


def by_user(user, lawyer=False, client=False, document=False):
    state_stack = []
    # user_owns
    # user_buys
    # user_uses
    # user_views
    # if (lawyer):
    #     find_state_by_ppl.filter()
    #
    # if (document):
    #     find_state_by_legal.filter()
    #
    # if (client):
    #     find_state_by_ppl.filter()


def create_document(f_stack_url):
    print('creating document')
    newDoc = Document(filestackURL=f_stack_url)
    newDoc.save()
    print('saved')