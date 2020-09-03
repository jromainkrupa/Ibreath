class ServiceWorkerController < ApplicationController
  protect_from_forgery
  skip_before_action :authenticate_user!


  def manifest
  end
end
