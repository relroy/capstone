class Api::V1::DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
end
