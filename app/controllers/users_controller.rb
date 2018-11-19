class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:index, :create]

  # GET /users
  # return index of users
  def index
    users = User.select(:id, :firstname, :lastname)
    json_response(users)
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /profile
  # return user's name and email
  def show
    mentee_list = []
    current_user.mentees.each do |email|
      mentee = User.find_by(email: email)
      if !mentee.nil?
        mentee_hash = {
          email: email,
          name: mentee.firstname + " " + mentee.lastname,
        }
        mentee_list.append(mentee_hash)
      end
    end

    json_response(firstname: current_user.firstname, lastname: current_user.lastname, email: current_user.email, mentor: current_user.mentor, mentees: mentee_list)
  end

  # PUT /profile
  # update user's name, email, and/or password
  def update
    if params[:mentee]
      mentee = User.find_by(email: params[:mentee])
      if mentee.nil?
        json_response(mentee_dne: Message.mentee_dne)
      elsif !current_user.mentees.include?(params[:mentee])
        current_user.mentees.append(params[:mentee])
        current_user.save
        head :no_content
      end
    else
      current_user.update(user_params)
      head :no_content
    end 
  end

  private

  def user_params
    params.permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation,
      :mentor,
    )
  end
end
