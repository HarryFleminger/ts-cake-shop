class DebugController < ApplicationController
  def raise_exception
    raise "forced raise"
  end
end
