class Api::V1::IcFlavorsController < ApplicationController
  def index
    @flavors = IcFlavor.all
  end
end
