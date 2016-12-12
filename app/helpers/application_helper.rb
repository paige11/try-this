module ApplicationHelper

  def user_or_guest_greeting
    if current_user
      current_user.username || "User"
    else
      "Guest"
    end
  end

  def greeting
    if current_user
      user = current_user.username || "User"
      "Hi, " + user
    end
  end

  def user_or_guest_link
    if current_user
      user_path(current_user)
    else
      new_user_registration_path
    end
  end

  def formatted_date_time
    created_at.strftime("%m-%d-%Y, %R")
  end

end
