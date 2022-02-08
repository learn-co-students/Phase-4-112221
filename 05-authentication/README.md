# Phase-2-Authentication

## SWBAT
- [ ] Explain the difference between Authentication and Authorization
- [ ] Explain Hashing and Salting
- [ ] Implement Bcrypt
- [ ] Build a sign-up and login route
- [ ] configure the rails app to use cookies and sessions

### Cookies and Sessions 
Authorization makes uses of cookies and sessions. This will be covered in more detail tomorrow but the application will need to be configured to use them.

### Configure rails to use cookies and sessions

```
# config/application.rb 

module FlatironTheaterApi
  class Application < Rails::Application
    config.load_defaults 6.1
    config.api_only = true


    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.action_dispatch.cookies_same_site_protection = :strict
  end
end

# app/controllers/application_controller.rb

class ApplicationController < ActionController::API
  include ActionController::Cookies
end


```


### BCrypt 
Bcrypt is a hashing and salting gem that can protect users's passwords. 

When given a password BCrypt can hash that password with salt

```
rails c
cow = BCrypt::Password.create('cow')
 => "$2a$12$aEyytH1qbti/pARIe3wE6e34ayWDLLEdQ8bwAlRYUYsPfSQF/BXLS" 

# The even if BCrypt is given the same password, the hash is different.
# This hash can be saved in the DB as a string and referenced later. 

cow = BCrypt::Password.create('cow')
 => "$2a$12$khRZRj8RYrZ52O7Yugw1z.z/tk9ChgaHnqtQHakNLEB1VpW7GVyA2" 

# The hash is made of two parts the salt and checksum
cow.checksum
 => "z/tk9ChgaHnqtQHakNLEB1VpW7GVyA2" 

 cow.salt
 => "$2a$12$khRZRj8RYrZ52O7Yugw1z." 

 # authenticate 
 # If the BCrypt Engin is given the correct password with the correct salt it will generate a hashed password instance. == when compared with an instance of a Bcrypt hashed password does something different.
# With this method we can see if the same password with the same salt produces the same string. 
# BCyrpt docs 
# 
#  def ==(secret)
#     super(BCrypt::Engine.hash_secret(secret, @salt))
#  end

#Hashes the users input with salt saved in db.
cow2 BCrypt::Engine::hash_secret('cow', cow.salt)

# checks above instance against password_digest in DB
# == hashes the password_digest and compares it with the instance we just created. 
cow2 == "$2a$12$YoAo8BwjPhrQIF8X..nQGeLFAI3jzltfe.rGzIeERJGswxD65ZjKi"

```

BCrypt does this for us under the hood. We just need to configure out app to use it. 

```
rails g migration add_password_digest_to_users

rake db:migrate

#db/schema
create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

#app/model/user.rb
class User < ApplicationRecord
    has_secure_password
end


```