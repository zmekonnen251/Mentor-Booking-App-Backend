class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user! , if: :user_signed_in?
  before_action :authenticate_mentor!, if: :mentor_signed_in?

  def reservations

  end

  def cancel_reservation
    
  end

  def reserve
    puts 'you are in the reservation'
  end

  private
  
  def booking_params
    params.permit(:mentor_id, :user_id)
  end
end
