class StocksController < ApplicationController
  def search
    unless params[:stock].present?
      respond_to do |format|
        flash.now[:alert] = "Enter a symbol to search"
        format.js { render partial: 'users/stock_result' }
      end
      return
    end

    @stock = Stock.new_lookup(params[:stock])

    if @stock.nil?
      respond_to do |format|
        flash.now[:alert] = "Enter a valid symbol to search"
        format.js { render partial: 'users/stock_result' }
      end
      return
    end

    respond_to do |format|
      format.js { render partial: 'users/stock_result' }
    end
  end
end
