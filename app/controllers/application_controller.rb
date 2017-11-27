class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :check_token, :except => [:unauthorized]

  # An extremely simply way to check hardcoded auth token
  # We should better use ember-simple-auth-token extension otherwise
  def check_token
    #if 1 == 1
    if request.env['HTTP_API_TOKEN'] != Rails.application.config.secret_token
      respond_to do |format|
        format.json { redirect_to '/unauthorized.json' }
        format.html { redirect_to '/unauthorized' }
      end
    end
  end

  def unauthorized
    respond_to do |format|
      format.json { render :json => {"errors" => ["Unauthorized access"]}}
      format.html { render :status => 401 }
    end
  end

end
