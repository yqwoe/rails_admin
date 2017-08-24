class HomeController < ApplicationController
  def index

    puts
    json = File.read('package.json')
    render :json => {:version => JSON.parse(json)["version"]}
  end
end
