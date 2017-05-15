class ControlController < ApplicationController
  def login
  	  	 if request.post?
    user = User.find_by(:email=>params[:email], :password=>params[:password]) 
      if !user.nil?
         session[:user] = user.id
          redirect_to(:controller=>"courses",:action=>"index") 
     
      
      else
       redirect_to(:controller=>"users",:action=>"new")
       
      end


     #else
      # @user = User.new 
    end
  end

  def logout

  session[:user]=nil
  redirect_to(:controller=>"control",:action=>"login")
  end
end
