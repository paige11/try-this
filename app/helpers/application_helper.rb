module ApplicationHelper

  def user_or_guest_greeting
    if current_user
      current_user.username
    else
      "Guest"
    end
  end

  def user_or_guest_link
    if current_user
      user_path(current_user)
    else
      new_user_registration_path
    end
  end

end
