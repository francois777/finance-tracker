class User < ApplicationRecord
  MAX_STOCK_LIMIT = 10
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_tracking?(ticker_symbol)
    stock = stocks.find { |stock | stock.ticker == ticker_symbol }
    !stock.nil?
  end

  def reached_max_stock?
    stocks.count >= MAX_STOCK_LIMIT
  end

  def self.find_by_partial(partial)
    partial.strip!
    users1 = User.where("first_name LIKE ?", "%" + partial + "%")
    users2 = User.where("last_name LIKE ?", "%" + partial + "%")
    (users1 | users2).uniq
  end

  def has_friend?(user, friend)
    friends = Friendship.where(user: user, friend: friend)
    friends.any?
  end
end
