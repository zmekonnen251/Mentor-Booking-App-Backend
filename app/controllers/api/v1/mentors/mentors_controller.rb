class Api::V1::Mentors::MentorsController < ApplicationController
  respond_to :json

  def index
    @unapproved = Mentor.where(approved: false).includes(:mentor_technologies)
    @approved = Mentor.includes(:mentor_technologies).where(approved: true)

    @unapproved_mentors = @unapproved.map do |mentor|
      {
        id: mentor.id,
        name: mentor.name,
        email: mentor.email,
        bio: mentor.bio,
        technologies: mentor.mentor_technologies.map { |technology| technology.technology.name },
        role: mentor.role,
        approved: mentor.approved,
        avatar_url: rails_blob_url(mentor.avatar)
      }
    end

    @approved_mentors = @approved.map do |mentor|
      {
        id: mentor.id,
        name: mentor.name,
        email: mentor.email,
        bio: mentor.bio,
        technologies: mentor.mentor_technologies.map { |technology| technology.technology.name },
        role: mentor.role,
        approved: mentor.approved,
        avatar_url: rails_blob_url(mentor.avatar)
      }
    end

    render json: { unapproved_mentors: @unapproved_mentors, approved_mentors: @approved_mentors }, status: :ok
  end

  def approve_mentor
    @params = params.permit(:id, :approved)
    @mentor = Mentor.find(@params[:id])
    if @mentor.approved == false && @mentor.update(approved: @params[:approved])
      render json: { message: 'Mentor approved successfully' }, status: :ok
      # MentorMailer.mentor_approved(@mentor.email).deliver_now
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def ban_mentor
    @params = params.permit(:id, :approved)
    @mentor = Mentor.find(@params[:id])

    if @mentor.approved == true && @mentor.update(approved: @params[:approved])
      render json: { message: 'Mentor banned successfully' }, status: :ok
      # MentorMailer.mentor_banned(@mentor.email).deliver_now
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def remove_mentor
    @params = params.permit(:id)
    @mentor = Mentor.find(@params[:id])
    if @mentor.destroy
      render json: { message: 'Mentor removed successfully' }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  # def send_mentor_approved_email(email)
  #   AdminMailer.mentor_approved(email).deliver_now
  # end
end
