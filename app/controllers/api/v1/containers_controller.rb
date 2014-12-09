class Api::V1::ContainersController < ApplicationController
  def index
    @flavors = Container.all    
  end
end
