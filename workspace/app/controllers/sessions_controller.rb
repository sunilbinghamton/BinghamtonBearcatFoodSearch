class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to new_reviews_and_rating_path, 
      :notice => "Login Successful"+ "\n"+ "Logged in as: "+user.name
      #flash[:success] = 'Login Successful'
    else
      #p "User login failure"
      redirect_to login_path, :notice => "Oops!! Invalid Username/Password. Please try again"
    end
  end  

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end