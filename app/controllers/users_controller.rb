class UsersController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:new, :create, :login, :attempt_login, :logout, :reset_password, :change_password, :update_password, :send_reset_password]
     
  def new
    @user = User.new
  end

  def create
  	if params[:user]
	    @user = User.new(params[:user])
	    if @user.save
	      session[:user_id] = @user.id
	      flash[:notice] = "Account created successfully!"
	      redirect_to root_url 
	    else
	      render("new")
	    end
	  else
	    redirect_to root_url
	  end  
  end
  
  def edit
    @user = User.find(current_user_id)
  end
  
  def update
    @user = User.find(current_user_id)
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Password updated.'
      redirect_to(:controller => 'settings')
    else
      render("edit")
    end
  end
  

  def delete
    @user = User.find(@current_user_id)
    render("delete")
  end

  def destroy
    @user = User.find(current_user_id)
    if @user.email == params[:email][:delete_user]
      User.find(current_user_id).destroy
      Habit.where('user_id=?', current_user_id).delete_all
      UsersHabit.where('user_id=?', current_user_id).delete_all
      HabitsUser.where('user_id=?', current_user_id).delete_all
      session.delete :user_id 
      cookies.delete :user_id 
      cookies.delete :trend
      flash[:notice] = "User removed. Goodbye."
      redirect_to root_url
    else
      flash[:notice] = "Email does not match." 
      render("delete")
    end  
  end
  
end