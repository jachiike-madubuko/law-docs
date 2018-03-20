from django.contrib import admin

from .models import State, Lawyer, Client, Document, Piece, View, Use, Buy, Own

admin.site.register(State)
admin.site.register(Lawyer)
admin.site.register(Client)
admin.site.register(Document)
admin.site.register(Piece)
admin.site.register(Use)
admin.site.register(Buy)
admin.site.register(Own)
admin.site.register(View)
admin.site.register(Firm)


# Register your models here.
