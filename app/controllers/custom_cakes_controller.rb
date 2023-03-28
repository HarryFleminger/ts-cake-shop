class CustomCakesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @custom_cakes = CustomCake.all
  end
end
