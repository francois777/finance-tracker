class UsersController < ApplicationController
  def my_portfolio
    @tracked_stock = current_user.stocks
  end

  def show_profile
    @user = User.find_by(id: params['id'])
    if @user.nil?
      flash[:alert] = "An invalid reference has been detected"
    end
  end

  def search
    unless params[:part_name].present?
      respond_to do |format|
        flash.now[:alert] = "Enter some part of the first or last name you have in mind."
        format.js { render partial: 'users/user_result' }
      end
      return
    end
    @users = User.find_by_partial(params[:part_name])
    @users.reject! { | user| user == current_user }

    if @users.none?
      respond_to do |format|
        flash.now[:alert] = "Try to search using a different partial."
        format.js { render partial: 'users/user_result' }
      end
      return
    end

    respond_to do |format|
      format.js { render partial: 'users/user_result' }
    end

  end
end
