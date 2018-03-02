# Welcome to Legal Gen

## Getting Started 

If this is your first time uses this repo, start by cloning: 
  -`git init
  git clone https://github.com/jachiike-madubuko/legal_gen.git`
  
Now you will checkout a new branch so the code you add doesn't indirectly crash the working program:
-`git checkout -b`

You can now start editting the code. When you've come to a stopping point stage your code:
-`git add -A`

Then you will commit your changes it to your branch
-`git commit -am "A quick message about what you've changed"`


You'll want to checkout the original branch and pull any changes that have been made to the code while you were editting:

-`git checkout
git pull`

Now merge with your newest branch:

-`git merge`

Now push your commit to the parent branch:
-`git push https://github.com/jachiike-madubuko/legal_gen.git`

Thank you for updating the repo! 

  
## Technologies & Softwares
1. Github is used for version control
2. [Travis-CI](https://travis-ci.org/) is used for continuous integration 
3. [Heroku Deployment](https://devcenter.heroku.com/categories/python) is used for deployment
4. [Python Django](https://www.djangoproject.com/) is the framework used to implement the MVC layout
5. [jQuery](https://jquery.com/) is used to implement AJAX and the UI for Document editting.
6. [TinyMCE](https://www.tinymce.com/) is a feature rich text editor with a jQuery plugin that will make document editing simple
7. [Djano-Front](http://django-front.readthedocs.io/en/latest/setup.html#add-your-own-editor) is used a socket for TinyMCE. A user will click on a section they would like editted, then Django-front will use jQuery to place a TinyMCE editor on top of that section. [Example here](https://camo.githubusercontent.com/653bba1510950ead2922e198bc5ceb1d76434cb3/687474703a2f2f646a616e676f2d66726f6e742e72656164746865646f63732e6f72672f656e2f6c61746573742f5f696d616765732f66726f6e742d656469742d75736167652e676966)
7. [Taggit](https://django-taggit.readthedocs.io/en/latest/) is used for simple tagging of DocPieces and Documents, and Forms
7. [Typeform API]( https://developer.typeform.com/responses/) is used for client interfacing when gathering data to craft a document
8. [File Stack API](https://dev.filestack.com/apps/AfEkWPbqOQYqKQt291D7dz/picker) is used to handle text blocks and user information and convert forms to pdfs.
10. [MySQL](https://www.mysql.com/) is the database management system.
11. [Stripe](https://stripe.com/docs/api) an api we will use for for payment processing.
12. [legalgenddoc.com](http://legalgenddoc.com) is the URL that our website will use.  



## User Guide

### Document Generator
	Insert Workflow Pictures and Video
