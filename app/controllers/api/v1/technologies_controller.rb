class Api::V1::TechnologiesController < ApplicationController
  def create
    @mentor_id = technologies_params(:mentor_id, :technologies)
    @technologies = params[:technologies]

    if Mentor.find(@mentor_id).persisted?
      @technologies.each do |technology|
        if Technology.nil?
          @technology = Technology.create(name: technology.downcase)

        elsif !Technology.find_by(name: technology.downcase).nil?
          @technology_id = Technology.find_by(name: technology.downcase).id
        else
          @technology = Technology.create(name: technology.downcase)
          @technology_id = @technology.id
        end
        mentor_tech = MentorTechnology.create(mentor_id: @mentor_id, technology_id: @technology_id)
      end
      render json: { message: 'Technologies added successfully.' }, status: :ok
    else
      render json: { message: 'Mentor not found.' }, status: :unprocessable_entity
    end
  end

  private

  def technologies_params
    params.permit(:mentor_id, :technologies)
  end
end
