class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    
    def before_sign_in_path_for(resource)
        home_dashboard_path
    end

    layout :layout

  	private
  		# set default layout
  		# if user accessing devise feature then use authentication layout otherwise use application layout
		def layout
			is_a?(DeviseController) ? 'authentication' : 'application'
	  	end
end
