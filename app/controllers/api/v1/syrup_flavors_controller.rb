class Api::V1::SyrupFlavorsController < ApplicationController
  def index
    @flavors = SyrupFlavor.all
  end
end
