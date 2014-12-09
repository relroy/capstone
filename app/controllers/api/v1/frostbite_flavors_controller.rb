class Api::V1::FrostbiteFlavorsController < ApplicationController
  def index
    @flavors = FrostbiteFlavor.all
  end
end
