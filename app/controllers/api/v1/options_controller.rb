class Api::V1::OptionsController < ApplicationController
  def index
    @flavors = Option.all
    
  end
end
