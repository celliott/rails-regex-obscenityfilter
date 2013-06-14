class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :prepare_for_mobile
  
  private
	
	def mobile_device?
	  if session[:iphone_param]
	    session[:iphone_param] == "1"
	  else
	    request.user_agent =~ /Mobile/
	  end
	end
	
	helper_method :mobile_device_ipad?
	helper_method :mobile_device?
	
	def prepare_for_mobile
	  session[:iphone_param] = ""
	  session[:iphone_param] = '1' if request.user_agent =~ /Mobile/
	end
end
