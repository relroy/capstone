class Api::V1::SmoothieFlavorsController < ApplicationController
def index
  @flavors = SmoothieFlavor.all
end
  
end
