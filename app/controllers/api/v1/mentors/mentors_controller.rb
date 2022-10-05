class Api::V1::Mentors::MentorsController < ApplicationController
  respond_to :json

  def index
    @unapproved = Mentor.includes(:mentor_technologies).where(approved: false)
    @approved = Mentor.includes(:mentor_technologies).where(approved: true)

    @unapproved_mentors = @unapproved.map do |mentor|
      {
        id: mentor.id,
        name: mentor.name,
        email: mentor.email,
        bio: mentor.bio,
        phone: mentor.phone,
        technologies: mentor.mentor_technologies.map { |technology| technology.technology.name },
        approved: mentor.approved,
        avatar_url: mentor.img_url
      }
    end

    @approved_mentors = @approved.map do |mentor|
      {
        id: mentor.id,
        name: mentor.name,
        email: mentor.email,
        bio: mentor.bio,
        phone: mentor.phone,
        technologies: mentor.mentor_technologies.map { |technology| technology.technology.name },
        approved: mentor.approved,
        avatar_url: mentor.img_url
      }
    end

    render json: { unapproved_mentors: @unapproved_mentors, approved_mentors: @approved_mentors }, status: :ok
  end

  def create
    @name = params[:mentor][:name]
    @phone = params[:mentor][:phone]
    @email = params[:mentor][:email]
    @img_url = params[:mentor][:img_url]
    @bio = params[:mentor][:bio]
    @mentor = Mentor.create(name: @name, phone: @phone, bio: @bio, email: @email, img_url: @img_url)

    if @mentor.save
      render json: { message: 'Mentor created successfully', mentor_id: @mentor.id }, status: :created
    else
      render json: { errors: @mentor.errors }, status: :unprocessable_entity
    end
  end

  def approve_mentor
    @mentor_id = params.permit(:id)[:id]
    @mentor = Mentor.find(@mentor_id.to_i)
    if @mentor.update(approved: true)
      render json: { message: 'Mentor approved successfully' }, status: :ok
      MentorMailer.mentor_approved(@mentor.email).deliver_now
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def ban_mentor
    @params = params.permit(:id, :approved)
    @mentor = Mentor.find(@params[:id])

    if @mentor.approved == true && @mentor.update(approved: @params[:approved])
      render json: { message: 'Mentor banned successfully' }, status: :ok
      MentorMailer.mentor_banned(@mentor.email).deliver_now
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

  # private
end
