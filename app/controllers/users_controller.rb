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
    json_response(firstname: current_user.firstname, lastname: current_user.lastname, email: current_user.email)
  end

  # PUT /profile
  # update user's name, email, and/or password
  def update
    current_user.update(user_params)
    head :no_content
  end

  private

  def user_params
    params.permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
