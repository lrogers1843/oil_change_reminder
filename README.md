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
Image model -> `has_one_attached: :picture` (creation of picture attachment)
###  Form Setup
added file and label field seperately. Why is my form different from tutorial? Figured out I'm on the 'simple_form' gem (from suspenders). Skipping the `multipart: true` tutorial param. Did whitelist "picture".
added div with some dropzone classes and stimulus stuff around file field.
### Controller Setup
Copied full JS from tutorial into my controller
### Style
Adding Tailwind via yarn
config.
Adding inter typeface, setup app/views/application/index.html.erb to demonstrate Tailwind styles working
Copied a lot of styles from Stimulus/Dropzone youtube above
In order to access and use custom css components, added the following to app/javascript/stylesheets/application.scss, since that's the only file referenced in app/javascript/packs/application.js: 
`@import "components/buttons";`
`@import "components/forms";`
### API Key
Adding HTTParty gem, success
Generating API Key on Google Cloud account, success. 
Adding to credentials.yml.enc via cli `EDITOR='code --wait' rails credentials:edit`
### Writing Call
drafting in image controller
took some time to get params right
### Storage
Set up amazon: option in storage.yml for Active Record
Set `config.active_storage.service = :amazon` in config/environments/development.rb
Added `gem "aws-sdk-s3", require: false`
Also created new bucket, edited permissions > CORS config
### Reconfig
did some troubleshooting bc open server processes causing IO error
Set deveopment.rb `config.active_job.queue_adapter = :async`
Set in .env `WEB_CONCURRENCY=2`
### Mailer
rails generate mailer NotificationMailer
setup previews in spec/mailers/previews/notification_mailer_preview.rb
added the following to config/environments/development.rb
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "oilchange.com" }
setup smtp domain on sendgrid.com
created config/initializers/smtp.rb
added sendgrid pw and username with `EDITOR='code --wait' rails credentials:edit`
added verified gmail as "from" in app/mailers/application_mailer.rb
### Refactor
moved api code into app/models/process_image.rb
### Mileage Notice on Upload
created new column on Image called "last_change"
added an write to that column in ProcessImage#process
added a method ProcessImage#current_oil_mileage to provide into to user after image save
### Putting Image Processing in Job
adding status attribute to images, with validations and default val
added oil miles column to image table
new job in app/jobs/image_processing_job.rb to hold all of processing steps, called in model instead of controller
### UI Design
- tweaked links on views, reduced form to essential inputs, styled submit button, set timestamp default in model. 
- hide button until photo uploaded (f.submit style: "display: none", id: "create") and lines 82+83 in app/javascript/controllers/dropzone_controller.js
- did some tailwinds css, all work in views: new, show, form, index
### Users
adding with devise: 
https://medium.com/swlh/https-medium-com-melee-santiago-using-devise-gem-to-handle-authentication-in-rails-app-538bbd231dde
https://github.com/heartcombo/devise#getting-started
https://altalogy.com/blog/rails-6-user-accounts-with-3-types-of-roles/
https://stackoverflow.com/questions/41972575/generating-devise-controllers-rails-devise
did basic setup
add following to app/controllers/application_controller.rb: before_action :authenticate_user!
user model: has many image, image model: belongs to user
migration add_user_to_image user:references
image controller: @image = Image.new(image_params.merge(user: current_user))
updated def last_oil_change_mileage
image controller: def index @images = Image.where(oil_change: "true", user_id: current_user)

### Deploy
(https://www.youtube.com/watch?v=lp_EEVWtObs)
installed heroku cli and logged in
config/database.yml adapter and db-url looks ok although syntax a bit diff. .fetch is diff, seems nbd
did: heroku apps:create oil-change-reminder
added RAILS_MASTER_KEY on heroku web dashboard (https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/)
error on deploy:  
    Running: rake assets:precompile
    rake aborted!
    KeyError: key not found: "APPLICATION_HOST"
commented out all mentions in config/environments/production.rb
DEPLOY SUCCEEDED
ran heroku run rails db:prepare
production storage to s3?
set: config.active_storage.service = :amazon
fix job queueing?
toggle worker dyno in webdashboard - resources
fix css?
have to add <%= stylesheet_pack_tag 'application' %> to app/views/layouts/application.html.erb becasue config/webpacker.yml has extract_css: true in production

put the asset host mentions back in production.rb, do provide those to heroku but not via rails configuration bc don't want to track all those mentions down to tweak. can skip smtp and just do these
ASSET_HOST: siteURL.herokuapp.com
APPLICATION_HOST: siteURL.herokuapp.com
AUTO_MIGRATE_DB: true

### Redeploy
After users set up locally, redeploy.
DON'T FORGET TO GIT ADD WHEN YOU RUN A GEM LIKE DEVISE BC THE RESOURCES IT GENERATES ARE NEW TO THE REPO!!! 
once that's done, run heroku run rails db:prepare to include db mods that came from user table creation/association


### To-Do
For odo parse challenges, maybe require a crop down to a single number. 
allow user logout
turn create button white
only trigger reminders from oil change
allow user car name and oil interval inputs
send notices to user email
pull photo date, only use upload date as alternate, and label as such
