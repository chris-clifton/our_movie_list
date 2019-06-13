class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Our Movie List"
  end
end
