class Api::V1::FrozenLatteFlavorsController < ApplicationController
  def index
    @flavors = FrozenLatteFlavor.all
  end
  
end
