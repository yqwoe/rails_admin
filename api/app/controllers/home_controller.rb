class HomeController < ApplicationController
  def index
    json = File.read('package.json')
    render :json => {:version => JSON.parse(json)["version"]}
  end
end
