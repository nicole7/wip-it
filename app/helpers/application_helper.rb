module ApplicationHelper

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def redirect_unless_logged_in
    redirect_to new_session_path unless logged_in?
  end

  def redirect_unless_owner(user)
    redirect_to root_path unless current_user == user
  end

  def authorized?(user)
    current_user == user
  end

  def find_and_ensure_user(id)
    user = User.find_by(id: id)
    redirect_to '/404' if user.nil? || user != current_user
  end

  def reset_screen
    clear_screen
    move_to_home
  end

  # Clears the content on the screen. Ah, a fresh canvas.
  def clear_screen
    print "\e[2J"
  end

  # Moves the insert point in the terminal back to the upper left.
  def move_to_home
    print "\e[H"
  end
end
