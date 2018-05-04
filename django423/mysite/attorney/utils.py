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


try catch for models

try:
    some.objects.get()
except ObjectDoesNotExist:
    print("awww")

'''
# TODO test state queries
# TODO test state queries
# https://docs.djangoproject.com/en/2.0/ref/forms/
# find formbuilder api
from attorney.models import *
from django.core.exceptions import ObjectDoesNotExist



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


def get_document_pieces(docID):
    p = list()
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    try:
        p = Document.legals.get(legalID=docID).piece_set.all().values('legalID', 'name', 'type', 'content')
        print(p)
    except ObjectDoesNotExist:
        print("awww")
    # searches users owned legals for ones that start with...
    # piece_list = my_pieces.filter(legal__name__istartswith=starts_with
    return p


def get_documents_list(max_results=0, starts_with=''):
    document_list = []
    # a list of all the own relationships with the user
    # add when sessions established
    # my_pieces = Own.owns.filter(person__personID=userID)
    # my_pieces = Piece.legals.all()
    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        document_list = Document.legals.filter(name__istartswith=starts_with).values('legalID', 'name', 'type',
                                                                                     'piecetype')
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


def get_my_documents_list(ipAddress, max_results=0, starts_with=''):
    try:
        x = Person.people.get(ipaddress=ipAddress)
        o = Own.owns.filter(person__personID__istartswith=x.personID)
        docs = list()
        for i in o.values('legal__legalID'): docs.append(i['legal__legalID'])
        document_list = Document.legals.filter(legalID__in=docs).values('legalID', 'name', 'filestackURL', 'price')

        if document_list:
            print("found it")
            print(document_list)
        else:
            print("nothing")

        return (document_list)
    except ObjectDoesNotExist:
        return ({'message': 'FAILED'})

    if starts_with:
        # searches users owned legals for ones that start with...
        # piece_list = my_pieces.filter(legal__name__istartswith=starts_with)
        document_list = Document.objects.filter(name__istartswith=starts_with).values('name', 'type', 'piecetype')

    if document_list and max_results > 0:
        if document_list.count() > max_results:
            document_list = document_list[:max_results]
    return document_list


def by_states(st, lawyer=False, client=False, document=False):
    print(st)
    state_stack = []
    # might need to be a dict when multiple models are needed
    if (lawyer):
        state_stack = Lawyer.people.filter(state=st).values('legalID', 'name', 'filestackURL', 'price', 'type')

    if (document):
        state_stack = Document.legals.filter(state=st).values('legalID', 'name', 'ownedby__firstname',
                                                              'ownedby__lastname', 'price', 'type')

    if (client):
        state_stack = Client.people.filter(state=st).values('legalID', 'name', 'filestackURL', 'price', 'type')
    print(state_stack)
    return state_stack


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


def create_document(name, f_stack_url):
    print('creating document')
    newDoc = Document(name=name, filestackURL=f_stack_url)
    newDoc.save()
    print('saved')


def create_piece(userID, piece):
    l = Lawyer.people.get(personID=userID)
    newPiece = Piece(
        name=piece['name'],
        content=piece['content'],
    )
    newPiece.save()


def create_form(formdata, docID):
    doc = Document.legals.get(legalID=docID)
    newForm = Form(doceditor=formdata, doc=doc)

    newForm.save()
    print(newForm)

def login(info, ip):
    try:
        x = Person.people.get(email=info['email'])
        if (x.password == info['password']):
            x.ipAddress = ip
            x.save()
            try:
                y = Lawyer.people.get(email=info['email'])
                type = 'Lawyer'
            except ObjectDoesNotExist:
                type = 'Client'

            return ({'name': x.firstname, 'id': x.personID, 'type': type})
        else:
            return ({'message': 'FAILED'})
    except ObjectDoesNotExist:
        return ({'message': 'FAILED'})
