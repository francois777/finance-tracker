class User < ApplicationRecord
  MAX_STOCK_LIMIT = 10
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_tracking?(ticker_symbol)
    stock = stocks.find { |stock | stock.ticker == ticker_symbol }
    !stock.nil?
  end

  def reached_max_stock?
    stocks.count >= MAX_STOCK_LIMIT
  end
end
