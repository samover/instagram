Instaclone
===================

At Makers Academy we receive a weekend challenge after learning a new technology for a week. This is an instagram clone using Ruby on Rails. It is fully test driven using rspec, capybara and factorygirl. There is a working example on [Heroku](http://instaclone-challenge.herokuapp.com/).

As an MVP, this instaclone lets users:
  
  * log in using OAuth
  * post pictures and add a caption
  * see pictures posted by other users
  * comment on a picture
  * like a picture

If I find the time, I would also like to implement:

  * ability to see a user's profile
  * add search


User Stories
-----------------

*Of course, in a real life situation I would write these out in dialogue with a client... so for the purpose of this challenge I will attempt the daring feat of begin both developer AND client.*

-------------------
```bash
As a user
So that I can use this instagram_clone
I would like to sign up and sign in for the app

As a user
So that I can use this instagram clone
I would like to log in with my facebook details

As a user
So that I can post a picture
I would like to upload a picture with a caption

As a user
So that I can see other user activity
I would like to see all posted photos

```

How to use the repo?
---------------
* Clone the Repo
* run the following:
  * `bundle install`
  * `createdb chitter_development`
  * `createdb chitter_test`
  * `rake db:dm_migrate`
  * `rake db:dm_migrate RACK_ENV=test`
* run tests: `rspec`
* run local chitter:
  * `rackup`
  * visit `localhost:9292`
