# Oil change reminder

## Getting Started
After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines
Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying
If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    % ./bin/deploy staging
    % ./bin/deploy production

## Process Log
### Setup with Suspenders Gem
install then run w/ cli. created app, including the readme sections before Process Log
### Set Up Active Storage
rails install -> db migrate to create tables and config updates to utilize Active Storage, the rails system for attaching files to models. 
### Set Up Models
Scaffold Image and Notification, no relationship
### Uploads with Stimulus and Dropzone
Installed Stimulus and Dropzone (JS Packages), Stimulus built a JS controllers directory.
https://www.youtube.com/watch?v=fg_8qJ-su6A
### Flag Image for Active Storage attachement
Image model -> has_one_attached: :picture (creation of picture attachment)
###  Form Setup
added file and label field seperately. Why is my form different from tutorial? Figured out I'm on the 'simple_form' gem (from suspenders). Skipping the "multipart: true" tutorial param. Did whitelist "picture".
added div with some dropzone classes and stimulus stuff around file field.
### Controller Setup
Copied full JS from tutorial into my controller
### Style
Adding Tailwind via yarn
config.
Adding inter typeface