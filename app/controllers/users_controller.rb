class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    json_render(@users)
  end

  # GET /users/1
  def show
    json_render(@user)
  end

  # POST /users
  def create
    # @user = User.new(user_params)

    # if @user.save
    #   json_render(@user)
    # else
    #   json_render(@user.errors, status: :unprocessable_entity)
    # end
    @user = User.create!(user_params)
    json_render @user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    json_render(@user)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    json_render @user
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
