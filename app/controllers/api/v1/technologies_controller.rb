class Api::V1::TechnologiesController < ApplicationController
  def create
    puts '#########################'
    puts params
    @mentor_id = params[:mentor_id]
    @technologies = params[:technologies]

    if Mentor.find(@mentor_id).persisted?
      @technologies.each do |technology|
        if Technology.nil? && Technology.find_by(name: technology).persisted?
          @technology_id = Technology.find_by(name: technology).id
        else
          @technology = Technology.create(name: technology)
          @technology_id = @technology.id
        end
        MentorTechnology.create(mentor_id: @mentor_id, technology_id: @technology_id)
      end
      render json: { message: 'Technologies added successfully.' }, status: :ok
    else
      render json: { message: 'Mentor not found.' }, status: :unprocessable_entity
    end
  end
end
