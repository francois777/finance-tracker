# README

## This is the Finance Tracker app from the Complete Ruby on Rails Developer course.

### Terminal instructions

Install devise gem, but after installation, do not follow the devise instruction for generating views. Rather install the Bootstrap view templates

`rails g devise:install
rails g devise User`

Install bootstrap
`rails g devise:views:bootstrap_templates`

#### Resources:

[https://getbootstrap.com/docs/4.6/getting-started/introduction/](https://getbootstrap.com/docs/4.6/getting-started/introduction/)
[https://www.mashrurhossain.com/blog/rails6bootstrap4](https://www.mashrurhossain.com/blog/rails6bootstrap4)
[https://devcenter.heroku.com/start](https://devcenter.heroku.com/start)

Look carefully at differences between commits because Mashrur's instructions were not always followed.
Also take note of the node version.

### Working with credentials

`> rails credentials:edit`

then, define your editor:

`$ EDITOR="code rails credentials:edit"`

For rubymine, do

`$ EDITOR="/Applications/RubyMine.app/Contents/MacOS/rubymine --wait" rails credentials:edit`

You can return to the terminal once the file is edited, saved and closed.

### IEX Finance API

[IEX Finance API](https://github.com/dblock/iex-ruby-client)

### Resources: 

[Post by Romil Mehta](https://blog.saeloun.com/2019/10/10/rails-6-adds-support-for-multi-environment-credentials.html)

### General Notes

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
