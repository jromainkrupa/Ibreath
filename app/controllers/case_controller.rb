require 'net/http'
require 'httparty'

class CaseController < ActionController::Base
  def unlock
    Smoke.create(user:current_user)
    HTTParty.post("#{Case.first.url}/unlock")
  end
end
