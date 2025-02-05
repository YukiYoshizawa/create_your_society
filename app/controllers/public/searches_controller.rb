class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @societies = Society.looks(params[:search], params[:word])
  end
end
