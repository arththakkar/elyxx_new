class ImagesController < ApplicationController
  def show
  	logger.warn("====================================================Image Show")
  	@image = params[:id]
  end
end
