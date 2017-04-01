class UsersController < ApplicationController
  before_action :authenticate_user!

  def bookings
    @bookings = current_user.bookings
  end

end
