module ApplicationHelper
  
  def display_error(field)
    if @user.errors[field].any?
        raw @user.errors[field].first
    end
  end

end