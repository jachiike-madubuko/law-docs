from __future__ import unicode_literals

from django.contrib.postgres.fields import JSONField, ArrayField
from django.db import models

# TODO added JSON encoder/decoder
"""
Change your models (in models.py).
Run python django423/mysite/manage.py makemigrations to create migrations for those changes
Run python django423/mysite/manage.py migrate --run-syncdb to apply those changes to the database.
"""
###########################################START OF USER ROLES##########################################
class Person(models.Model):
    personID = models.AutoField(db_column='personID', primary_key=True, max_length=9, unique=True)
    firstname = models.CharField(db_column='firstName', max_length=50)
    lastname = models.CharField(db_column='lastName', max_length=50)
    email = models.EmailField(db_column='emailAddress', unique=True)
    password = models.CharField(db_column='password', max_length=20)
    DOB = models.DateField(db_column='dob', null=True)
    created = models.DateTimeField(db_column='created', auto_now_add=True, null=True)
    lastlogin = models.DateTimeField(db_column='lastLogin')
    ipaddress = models.GenericIPAddressField(db_column='IPAddress', unpack_ipv4=True)
    tags = ArrayField(models.CharField(max_length=200), null=True)


    people = models.Manager()

    @property
    def fullname(self):
        return '%s %s' % (self.firstname, self.lastname)

    class Meta:
        managed = True
        ordering = ["lastname"]
        verbose_name_plural = "people"


    def __str__(self):
        return self.fullname


class Client(Person):
    clientdata = JSONField(null=True)  # used for merge templates

    class Meta:
        managed = True

class Lawyer(Person):
    lawyerdata = JSONField(null=True)

    class Meta:
        managed = True

class Firm(models.Model):
    firmID = models.AutoField(db_column='firmID', primary_key=True, max_length=9, unique=True)
    name = models.CharField(max_length=50)
    employee = models.ManyToManyField(Person, through='Employee', related_name='lawyers_in_firm')

    class Meta:
        managed = True

    def __str__(self):
        return self.name

class Employee(models.Model):
    employed = models.ForeignKey(Person, on_delete=models.CASCADE, related_name='employed_lawyer', default=1)
    employer = models.ForeignKey(Firm, on_delete=models.CASCADE, related_name='employing_firm', default=1)
    date_joined = models.DateField(auto_now_add=True)

    employees = models.Manager()

    class Meta:
        managed = True
        ordering = ["date_joined"]

#########################################END OF USER ROLES###############################################

########################################START OF LEGALS#################################################
class Legal(models.Model):
    legalID = models.AutoField(db_column='legalID', primary_key=True, max_length=9, unique=True)
    name = models.CharField(db_column='Name', max_length=50)
    type = models.CharField(db_column='Type', max_length=45, blank=True, null=True)
    created = models.DateTimeField(db_column='Created', auto_now_add=True, null=True)
    updated = models.DateTimeField(db_column='LastUpdated', auto_now=True, null=True)
    tags = ArrayField(models.CharField(max_length=200), blank=True, null=True)

    # add in many to many relationship
    viewedby = models.ManyToManyField(Person, through='View', related_name='someone_viewed')
    usedby = models.ManyToManyField(Person, through='Use', related_name='someone_used')
    boughtby = models.ManyToManyField(Person, through='Buy', related_name='someone_bought')
    ownedby = models.ManyToManyField(Person, through='Own', related_name='someone_owned')

    legals = models.Manager()

    class Meta:
        ordering = ["type"]
        managed = True

    def __str__(self):
        return self.name


class Document(Legal):
    filestackURL = models.URLField(db_column='fileStackURL', blank=True, null=True, unique=True)
    price = models.FloatField(db_column='price', blank=True, default=19.99)


    class Meta:
        managed = True

class Form(Legal):
    typeform = JSONField(db_column='typeForm', blank=True, null=True)
    doceditor = JSONField(db_column='docEditor', blank=True, null=True)

    class Meta:
        managed = True

class Piece(Legal):
    content = models.CharField(db_column='content', max_length=500, blank=True, null=True)

    # models.ImageField()
    piecetype = models.CharField(db_column='pieceType', max_length=30, blank=True, null=True)

    class Meta:
        managed = True
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
        unique=True,
        max_length=2,
        choices=STATE_CHOICES)

    inState = models.ManyToManyField(Person, through='InState', related_name='person_in_state')
    forState = models.ManyToManyField(Legal, through='ForState', related_name='item_in_state')

    class Meta:
        ordering = ['state']
        managed = True


    def __str__(self):
        return self.state
########################################END SEARCH TABLES#################################################

######################################START OF USER <-> LEGAL RELATIONSHIPS###############################
# TODO simplify and create fake data for these relationships
class View(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    lastviewed = models.DateTimeField(auto_now=True, auto_now_add=False)
    numberOfviews = models.IntegerField()

    views = models.Manager()

    class Meta:
        managed = True
        ordering = ["lastviewed"]


class Use(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    duration = models.DurationField(null=True)
    lastused = models.DateTimeField(auto_now=True, auto_now_add=False)

    uses = models.Manager()

    class Meta:
        ordering = ["lastused"]
        managed = True



class Buy(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    purchased = models.DateTimeField(auto_now_add=True)

    buys = models.Manager()

    class Meta:
        ordering = ["purchased"]
        managed = True



class Own(models.Model):
    person = models.ForeignKey(Person, models.DO_NOTHING)
    legal = models.ForeignKey(Legal, models.DO_NOTHING)
    owned = models.DateTimeField(auto_now_add=True)

    owns = models.Manager()

    class Meta:
        ordering = ["owned"]
        managed = True


class InState(models.Model):
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    people_states = models.Manager()

    class Meta:
        managed = True

class ForState(models.Model):
    legal = models.ForeignKey(Legal, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    legals_states = models.Manager()

    class Meta:
        managed = True

#####################################END OF USER <-> LEGAL RELATIONSHIPS###############################


# TODO enter the code that creates OWN, VIEW, and BUY models as unique together with person and legal
