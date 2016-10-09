module ApplicationHelper

  def user_or_guest_greeting
    if current_user
      current_user.first_name || current_user.email
    else
      "Guest"
    end
  end
  
end
