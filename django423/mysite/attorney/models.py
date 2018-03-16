from __future__ import unicode_literals

from django.contrib.postgres.fields import JSONField, ArrayField
from django.db import models


########################################START OF LEGALS#################################################

class Legal(models.Model):
    legalID = models.CharField(db_column='legalID', primary_key=True, max_length=9)
    title = models.CharField(db_column='Title', max_length=512)
    type = models.CharField(db_column='Type', max_length=45, blank=True, null=True)
    created = models.DataTimeField(db_column='Created', auto_now_add=True, null=True)
    updated = models.DataTimeField(db_column='LastUpdated', auto_now=True, null=True)

    # add in many to many relationship
    Tag = models.ManyToManyField(Tags, through='Tags', through_fields=('personID', 'legalID'))
    View = models.ManyToManyField(Person, through='View', through_fields=('personID', 'legalID'))
    Use = models.ManyToManyField(Person, through='Use', through_fields=('personID', 'legalID'))
    Buy = models.ManyToManyField(Person, through='Buy', through_fields=('personID', 'legalID'))
    Owns = models.ManyToManyField(Person, through='Owns', through_fields=('personID', 'legalID'))

    class Meta:
        managed = False
        db_table = 'LEGAL'

    def __str__(self):
        return self.title


class Document(Legal):
    legalID = models.ForeignKey(Legal, models.DO_NOTHING, db_column='legalID')
    filestackURL = models.URLField(db_column='fileStackURL', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'DOCUMENT'

    def __str__(self):
        return self.title


class Form(Legal):
    typeform = JSONField(db_column='typeForm', blank=True, null=True)
    doceditor = JSONField(db_column='docEditor', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'FORM'

    def __str__(self):
        return self.title


class Piece(Legal):
    content = JSONField(db_column='content', blank=True, null=True)
    # models.ImageField()
    piecetype = models.CharField(db_column='pieceType', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'PIECE'

    def __str__(self):
        return self.title


###########################################END OF LEGALS##################################################

########################################START SEARCH TABLES###############################################

class Tags(models.Model):
    tagID = models.AutoField()
    tagname = models.CharField(db_column='tagName', max_length=45)

    class Meta:
        managed = False
        db_table = 'TAGS'
        # TODO
        # GENERALIZE TO PERSONS AND LEGALS
        unique_together = (('legalID', 'tagName'),)

    def __str__(self):
        return self.tagname


class State(models.Model):
    DC = 'DC'
    AL = 'AL'
    AK = 'AK'
    AZ = 'AZ'
    AR = 'AR'
    CA = 'CA'
    CO = 'CO'
    CT = 'CT'
    DE = 'DE'
    FL = 'FL'
    GA = 'GA'
    HI = 'HI'
    ID = 'ID'
    IL = 'IL'
    IN = 'IN'
    IA = 'IA'
    KS = 'KS'
    KY = 'KY'
    LA = 'LA'
    ME = 'ME'
    MD = 'MD'
    MA = 'MA'
    MI = 'MI'
    MN = 'MN'
    MS = 'MS'
    MO = 'MO'
    MT = 'MT'
    NE = 'NE'
    NV = 'NV'
    NH = 'NH'
    NJ = 'NJ'
    NM = 'NM'
    NY = 'NY'
    NC = 'NC'
    ND = 'ND'
    OH = 'OH'
    OK = 'OK'
    OR = 'OR'
    PA = 'PA'
    RI = 'RI'
    SC = 'SC'
    SD = 'SD'
    TN = 'TN'
    TX = 'TX'
    UT = 'UT'
    VT = 'VT'
    VA = 'VA'
    WA = 'WA'
    WV = 'WV'
    WI = 'WI'
    WY = 'WY'
    STATE_CHOICES = (
        (DC, 'District of Columbia'),
        (AL, 'Alabama'),
        (AK, 'Alaska'),
        (AZ, 'Arizona'),
        (AR, 'Arkansas'),
        (CA, 'California'),
        (CO, 'Colorado'),
        (CT, 'Connecticut'),
        (DE, 'Delaware'),
        (FL, 'Florida'),
        (GA, 'Georgia'),
        (HI, 'Hawaii'),
        (ID, 'Idaho'),
        (IL, 'Illinois'),
        (IN, 'Indiana'),
        (IA, 'Iowa'),
        (KS, 'Kansas'),
        (KY, 'Kentucky'),
        (LA, 'Louisiana'),
        (ME, 'Maine'),
        (MD, 'Maryland'),
        (MA, 'Massachusetts'),
        (MI, 'Michigan'),
        (MN, 'Minnesota'),
        (MS, 'Mississippi'),
        (MO, 'Missouri'),
        (MT, 'Montana'),
        (NE, 'Nebraska'),
        (NV, 'Nevada'),
        (NH, 'New Hampshire'),
        (NJ, 'New Jersey'),
        (NM, 'New Mexico'),
        (NY, 'New York'),
        (NC, 'North Carolina'),
        (ND, 'North Dakota'),
        (OH, 'Ohio'),
        (OK, 'Oklahoma'),
        (OR, 'Oregon'),
        (PA, 'Pennsylvania'),
        (RI, 'Rhode Island'),
        (SC, 'South Carolina'),
        (SD, 'South Dakota'),
        (TN, 'Tennessee'),
        (TX, 'Texas'),
        (UT, 'Utah'),
        (VT, 'Vermont'),
        (VA, 'Virginia'),
        (WA, 'Washington'),
        (WV, 'West Virginia'),
        (WI, 'Wisconsin'),
        (WY, 'Wyoming'),

    )
    state = models.CharField(
        max_length=2,
        choices=STATE_CHOICES)
    stateID = models.AutoField()

    class Meta:
        managed = False
        db_table = 'STATE'

    def __str__(self):
        return self.state


########################################END SEARCH TABLES#################################################


###########################################START OF USER ROLES##########################################
class Person(models.Model):
    personID = models.AutoField(db_column='personID', primary_key=True, max_length=9)
    firstname = models.CharField(db_column='firstName', max_length=128)
    lastname = models.CharField(db_column='lastName', max_length=128)
    email = models.EmailField(db_column='emailAddress')
    password = models.CharField(db_column='password', max_length=20)
    ipaddress = models.GenericIPAddressField(db_column='IPAddress', unpack_ipv4=True)
    birthyear = models.IntegerField(db_column='birthYear', blank=True, null=True)
    deathyear = models.IntegerField(db_column='deathYear', blank=True, null=True)

    # add in many to many relationship
    Tag = models.ManyToManyField(Tags, through='Tags', through_fields=('personID', 'legalID'))
    View = models.ManyToManyField(Legal, through='View', through_fields=('personID', 'legalID'))
    Use = models.ManyToManyField(Legal, through='Use', through_fields=('personID', 'legalID'))
    Buy = models.ManyToManyField(Legal, through='Buy', through_fields=('personID', 'legalID'))
    Owns = models.ManyToManyField(Legal, through='Owns', through_fields=('personID', 'legalID'))

    class Meta:
        managed = False
        db_table = 'PERSON'

    def __str__(self):
        return self.primaryname


class Client(Person):
    metadata = JSONField()  # used for mergetemplates

    # add in many to many relationship
    class Meta:
        managed = False
        db_table = 'CLIENT'

    def __str__(self):
        return self.firstname


class Lawyer(Person):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', primary_key=True)

    class Meta:
        managed = False
        db_table = 'LAWYER'

    def __str__(self):
        return self.firstname


class Firm(Person):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', primary_key=True)
    employees = ArrayField

    class Meta:
        managed = False
        db_table = 'FIRM'

    def __str__(self):
        return self.firstname


#########################################END OF USER ROLES###############################################

######################################START OF USER <-> LEGAL RELATIONSHIPS###############################
class View(models.Model):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', primary_key=True,
                                 related_name='person_person')
    legalID = models.ForeignKey(Legal, models.DO_NOTHING, db_column='legalID')
    duration = models.DurationField()
    lastviewed = models.DateTimeField(auto_now=True, auto_now_add=False)
    numberOviews = models.IntegerField(auto_now=False, auto_now_add=False)

    class Meta:
        managed = False
        db_table = 'VIEW'
        unique_together = (('personID', 'legalID'),)


class Use(models.Model):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', related_name='person_person')
    legalID = models.ForeignKey('Title', models.DO_NOTHING, db_column='legalID')
    duration = models.DurationField()
    lastused = models.DateTimeField(auto_now=True, auto_now_add=False)

    class Meta:
        managed = False
        db_table = 'USE'
        unique_together = (('personID', 'legalID'),)


class Buy(models.Model):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', primary_key=True,
                                 related_name='person_person')
    legalID = models.ForeignKey('Title', models.DO_NOTHING, db_column='legalID')
    duration = models.DurationField()
    purchased = models.DateTimeField(auto_now=False, auto_now_add=False)

    class Meta:
        managed = False
        db_table = 'BUY'
        unique_together = (('personID', 'legalID'),)


class Own(models.Model):
    personID = models.ForeignKey(Person, models.DO_NOTHING, db_column='personID', primary_key=True,
                                 related_name='person_person')
    titletconst = models.ForeignKey('Title', models.DO_NOTHING, db_column='legalID')
    owned = models.DateTimeField(auto_now=False, auto_now_add=False)

    class Meta:
        managed = False
        db_table = 'OWN'
        unique_together = (('personID', 'legalID'),)


class Tagged(models.Model):
    itemID = models.ForeignKey(models.Model, models.DO_NOTHING, db_column='itemID', primary_key=True)
    tagID = models.ForeignKey('Tag', models.DO_NOTHING, db_column='tagID')
    tagdate = models.DateTimeField(auto_now=False, auto_now_add=False)

    class Meta:
        managed = True
        db_table = 'TAGGED'
        unique_together = (('itemID', 'tagID'),)
######################################END OF USER <-> LEGAL RELATIONSHIPS###############################
