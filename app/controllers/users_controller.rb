class UsersController < ApplicationController
  before_action :authenticate_user!

  def bookings

    @bookings = current_user.bookings
  end

  protected

  def pastBookings
    current_user.bookings.where('start_date <= ?', DateTime.now.strftime('%Y-%m-%d'))
  end

  def futureBookings
    current_user.bookings.where('(start_date > ?)', DateTime.now.strftime('%Y-%m-%d'))
  end

end
