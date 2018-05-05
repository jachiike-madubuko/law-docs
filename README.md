# [Welcome to Legal Gen](https://jachiike-madubuko.github.io/legal_gen/)

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

## Run the Development Server
To run the web application locally simple go to the legal_gen directory and enter the command:
-`python django423/mysite/manage.py runserver`

## Technologies & Softwares
1. Github is used for version control
2. [Travis-CI](https://travis-ci.org/) is used for continuous integration 
3. [Heroku Deployment](https://devcenter.heroku.com/categories/python) is used for deployment
4. [Python Django](https://www.djangoproject.com/) is the framework used to implement the MVC layout
5. [jQuery](https://jquery.com/) is used to implement AJAX and the UI for Document editting.
6. [TinyMCE](https://www.tinymce.com/) is a feature rich text editor with a jQuery plugin that will make document editing simple.
7. [FormBuilder](http://formbuilder.readthedocs.io/en/latest/) is used for the lawyer's form building page, and also services as the client's form completion interface.
8. [Taggit](https://django-taggit.readthedocs.io/en/latest/) is used for simple tagging of DocPieces and Documents, and Forms
9. [New Signature Interactive US Map]( https://newsignature.github.io/us-map/) is used for clients to search for documents by state.
10. [File Stack API](https://dev.filestack.com/apps/AfEkWPbqOQYqKQt291D7dz/picker) is used to handle text blocks and user information and convert forms to pdfs.
11. [PostgreSQL](https://www.mysql.com/) is the database management system.
12. [Stripe](https://stripe.com/docs/api) an api we will use for for payment processing.
13. [legalgenddoc.com](http://legalgenddoc.com) is the URL that our website will use.  



## [User Guide](https://docs.google.com/document/d/1QC3GKInvcPRJdnacKKn6T245lnAdAL6Ad9w-RK3h-aM/edit?usp=sharing)


## Acknowledgements 

Matthew Sessa for letting us use his server to host our website. We would also like to thank him for his help figuring out Qunit testing.  
