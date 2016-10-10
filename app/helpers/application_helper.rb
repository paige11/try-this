module ApplicationHelper

  def user_or_guest_greeting
    if current_user
      current_user.first_name || current_user.email
    else
      "Guest"
    end
  end

  def user_or_guest_link
    if current_user
      user_path(current_user)
    else
      root_path
    end
  end

end
