from __future__ import unicode_literals

from django.contrib.postgres.fields import JSONField, ArrayField
from django.db import models


# TODO added JSON encoder/decoder

###########################################START OF USER ROLES##########################################
class Person(models.Model):
    personID = models.AutoField(db_column='personID', primary_key=True, max_length=9, unique=True)
    firstname = models.CharField(db_column='firstName', max_length=128)
    lastname = models.CharField(db_column='lastName', max_length=128)
    email = models.EmailField(db_column='emailAddress', unique=True)
    password = models.CharField(db_column='password', max_length=20)
    created = models.DateTimeField(db_column='created', auto_now_add=True, null=True)
    lastlogin = models.DateTimeField(db_column='lastLogin')
    ipaddress = models.GenericIPAddressField(db_column='IPAddress', unpack_ipv4=True)
    birthyear = models.IntegerField(db_column='birthYear', blank=True, null=True)
    deathyear = models.IntegerField(db_column='deathYear', blank=True, null=True)
    tags = ArrayField(models.CharField(max_length=200), blank=True)

    people = models.Manager()

    @property
    def full_name(self):
        "Returns the person's full name."
        return '%s %s' % (self.firstname, self.lastname)

    class Meta:
        managed = False
        db_table = 'PERSON'
        ordering = ["lastname"]
        verbose_name_plural = "people"

    def __str__(self):
        return self.firstname


class Client(Person):
    clientdata = JSONField()  # used for merge templates

    class Meta:
        managed = False
        db_table = 'CLIENT'


class Lawyer(Person):
    lawyerdata = JSONField()

    class Meta:
        managed = False
        db_table = 'LAWYER'


class Firm(models.Model):
    name = models.CharField(max_length=128)
    employee = models.ManyToManyField(Person, through='Employee', related_name='lawyers_in_firm')


class Employee(models.Model):
    employed = models.ForeignKey(Person, on_delete=models.CASCADE, related_name='lawyer_employed')
    employer = models.ForeignKey(Firm, on_delete=models.CASCADE, related_name='employ_firm')
    date_joined = models.DateField(auto_now_add=True)

    employees = models.Manager()

    class Meta:
        managed = False
        db_table = 'Employee'
        ordering = ["date_joined"]


#########################################END OF USER ROLES###############################################

########################################START OF LEGALS#################################################

class Legal(models.Model):
    legalID = models.CharField(db_column='legalID', primary_key=True, max_length=9, unique=True)
    name = models.CharField(db_column='Name', max_length=512)
    type = models.CharField(db_column='Type', max_length=45, blank=True, null=True)
    created = models.DateTimeField(db_column='Created', auto_now_add=True, null=True)
    updated = models.DateTimeField(db_column='LastUpdated', auto_now=True, null=True)
    tags = ArrayField(models.CharField(max_length=200), blank=True)

    # add in many to many relationship
    viewedby = models.ManyToManyField(Person, through='View', related_name='someone_viewed')
    usedby = models.ManyToManyField(Person, through='Use', related_name='someone_used')
    boughtby = models.ManyToManyField(Person, through='Buy', related_name='someone_bought')
    ownedby = models.ManyToManyField(Person, through='Own', related_name='someone_owned')

    legals = models.Manager()

    class Meta:
        managed = False
        db_table = 'LEGAL'
        ordering = ["type"]

    def __str__(self):
        return self.title


class Document(Legal):
    filestackURL = models.URLField(db_column='fileStackURL', blank=True, null=True, unique=True)

    class Meta:
        managed = False
        db_table = 'DOCUMENT'


class Form(Legal):
    typeform = JSONField(db_column='typeForm', blank=True, null=True)
    doceditor = JSONField(db_column='docEditor', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'FORM'


class Piece(Legal):
    content = JSONField(db_column='content', blank=True, null=True)
    # models.ImageField()
    piecetype = models.CharField(db_column='pieceType', max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'PIECE'


###########################################END OF LEGALS##################################################

########################################START SEARCH TABLES###############################################

class State(models.Model):
    STATE_CHOICES = (
        ('DC', 'District of Columbia'),
        ('AL', 'Alabama'),
        ('AK', 'Alaska'),
        ('AZ', 'Arizona'),
        ('AR', 'Arkansas'),
        ('CA', 'California'),
        ('CO', 'Colorado'),
        ('CT', 'Connecticut'),
        ('DE', 'Delaware'),
        ('FL', 'Florida'),
        ('GA', 'Georgia'),
        ('HI', 'Hawaii'),
        ('ID', 'Idaho'),
        ('IL', 'Illinois'),
        ('IN', 'Indiana'),
        ('IA', 'Iowa'),
        ('KS', 'Kansas'),
        ('KY', 'Kentucky'),
        ('LA', 'Louisiana'),
        ('ME', 'Maine'),
        ('MD', 'Maryland'),
        ('MA', 'Massachusetts'),
        ('MI', 'Michigan'),
        ('MN', 'Minnesota'),
        ('MS', 'Mississippi'),
        ('MO', 'Missouri'),
        ('MT', 'Montana'),
        ('NE', 'Nebraska'),
        ('NV', 'Nevada'),
        ('NH', 'New Hampshire'),
        ('NJ', 'New Jersey'),
        ('NM', 'New Mexico'),
        ('NY', 'New York'),
        ('NC', 'North Carolina'),
        ('ND', 'North Dakota'),
        ('OH', 'Ohio'),
        ('OK', 'Oklahoma'),
        ('OR', 'Oregon'),
        ('PA', 'Pennsylvania'),
        ('RI', 'Rhode Island'),
        ('SC', 'South Carolina'),
        ('SD', 'South Dakota'),
        ('TN', 'Tennessee'),
        ('TX', 'Texas'),
        ('UT', 'Utah'),
        ('VT', 'Vermont'),
        ('VA', 'Virginia'),
        ('WA', 'Washington'),
        ('WV', 'West Virginia'),
        ('WI', 'Wisconsin'),
        ('WY', 'Wyoming'),
    )

    states = models.Manager()

    state = models.CharField(
        max_length=2,
        choices=STATE_CHOICES)

    inState = models.ManyToManyField(Person, through='InState', related_name='person_in_state')
    forState = models.ManyToManyField(Legal, through='ForState', related_name='item_in_state')

    class Meta:
        managed = False
        db_table = 'STATE'
        ordering = ['state']

    def __str__(self):
        return self.state


########################################END SEARCH TABLES#################################################

######################################START OF USER <-> LEGAL RELATIONSHIPS###############################


class View(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    duration = models.DurationField()
    lastviewed = models.DateTimeField(auto_now=True, auto_now_add=False)
    numberOviews = models.IntegerField()

    views = models.Manager()

    class Meta:
        managed = False
        db_table = 'VIEW'
        ordering = ["lastviewed"]


class Use(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    duration = models.DurationField()
    lastused = models.DateTimeField(auto_now=True, auto_now_add=False)

    uses = models.Manager()

    class Meta:
        managed = False
        db_table = 'USE'
        ordering = ["lastused"]


class Buy(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    duration = models.DurationField()
    purchased = models.DateTimeField(auto_now_add=True)

    buys = models.Manager()

    class Meta:
        managed = False
        db_table = 'BUY'
        ordering = ["purchased"]


class Own(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    owned = models.DateTimeField(auto_now_add=True)

    owns = models.Manager()

    class Meta:
        managed = False
        db_table = 'OWN'
        ordering = ["owned"]


class InState(models.Model):
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    people_states = models.Manager()


class ForState(models.Model):
    legal = models.ForeignKey(Legal, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    legals_states = models.Manager()

#####################################END OF USER <-> LEGAL RELATIONSHIPS###############################
