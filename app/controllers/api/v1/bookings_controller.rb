class Api::V1::BookingsController < ApplicationController
  before_action :authenticate_user! , if: :user_signed_in?
  before_action :authenticate_mentor!, if: :mentor_signed_in?

  def reservations

  end

  def cancel_reservation

  end

  def reserve
    @mentor = Mentor.find(booking_params[:mentor_id].to_i)
    @user= User.find(booking_params[:user_id].to_i)
    @city = booking_params[:city]
    @country = booking_params[:country]
    @date = booking_params[:date]

    @booking = Booking.create(mentor: @mentor, user: @user, city: @city, date: @date, country: @country)

    if @booking.save
      render json: { message: 'Booking created successfully.' }, status: :ok
    else
      render json: { message: 'Booking not created.' }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.permit(:mentor_id, :user_id, :city, :country, :date)
  end
end
