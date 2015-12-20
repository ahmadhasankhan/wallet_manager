class User < ActiveRecord::Base
	acts_as_authentic do |c|
     #c.validate_login_field = false
     c.login_field = :email
    #c.validate_password_field = true
   end
end
