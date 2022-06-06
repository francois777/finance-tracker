class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.nil?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    if stock.nil?
      flash[:alert] = "Stock not found"
      redirect_to my_portfolio_path and return
    end
    if current_user.stocks.include?(stock)
      flash[:alert] = "You are already tracking this stock"
      redirect_to my_portfolio_path and return
    end

    user = current_user
    user.stocks << stock
    flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.find_by(user: current_user, stock: stock)
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
end
