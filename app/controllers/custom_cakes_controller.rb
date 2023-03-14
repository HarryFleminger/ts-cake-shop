class CustomCakesController < ApplicationController
  def index
    @custom_cakes = CustomCake.all
  end
end
