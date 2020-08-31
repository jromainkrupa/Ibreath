require 'net/http'
require 'httparty'

class CaseController < ActionController::Base
  def unlock
    HTTParty.post(Case.first.url, body: {password: "totolatata" })
  end
end
