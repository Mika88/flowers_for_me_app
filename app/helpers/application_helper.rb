module ApplicationHelper
  def login_flow
    if logged_in? 
      link_to "Login", user_path(current_user) 
    else
      link_to "Login", '/login' 
    end 
  end
  
  def sign_up_flow
    if logged_in? 
      link_to "Sign Up", user_path(current_user) 
    else
      link_to "Sign Up", new_user_path  
    end 
  end
end
