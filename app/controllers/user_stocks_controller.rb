class UserStocksController < ApplicationController
  def create
    if current_user.reached_max_stock?
      flash[:alert] = "You have reached your maximum limit for stock tracking!"
      redirect_to return_path and return
    end
    stock = Stock.check_db(params[:ticker])
    if stock.nil?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    if stock.nil?
      flash[:alert] = "Stock not found"
      redirect_to return_path and return
    end
    if current_user.stocks.include?(stock)
      flash[:alert] = "You are already tracking this stock"
      redirect_to return_path and return
    end
    user = current_user
    user.stocks << stock
    flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to return_path
  end

  def add_stock_of_a_friend
    return_path(show_profile_path + "?id=#{params['id']}")
    create
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.find_by(user: current_user, stock: stock)
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end

  private

  def return_path(path = 'my_portfolio')
    return @return_path if @return_path
    if path == 'my_portfolio'
      @return_path = my_portfolio_path
    else
      @return_path = path
    end
  end
end
