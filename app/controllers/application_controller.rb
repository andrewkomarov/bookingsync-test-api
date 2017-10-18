class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :set_headers

  #def set_headers
    #response.headers['Content-Type'] = 'application/vnd.api+json'
  #end
end
