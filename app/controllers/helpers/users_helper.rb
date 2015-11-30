module UsersHelper
  def fetch_username user_id 
   return '' unless user_id
   user = User.all.find(user_id)
   user.email.gsub(/@.+/, '') 
  end
end
