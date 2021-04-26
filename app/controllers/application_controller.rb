class ApplicationController < ActionController::Base
  def hello
    render plain: "OK"
  end
end
