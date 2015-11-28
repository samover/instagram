module UsersHelper
  def email_to_username email
   email.gsub(/@.+/, '') 
  end
end
