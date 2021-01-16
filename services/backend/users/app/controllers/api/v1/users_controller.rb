module Api::V1
  class UsersController < ApplicationController

    # POST /users
    def create
      @user = User.new(create_user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # GET /users/profile
    def show_profile
      render json: current_user
    end

    # PATCH/PUT /users/profile
    def update_profile
      if current_user.update(update_user_params)
        render json: current_user
      else
        render json: current_user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/profile
    def destroy_profile
      current_user.destroy
      logout
    end

    private

    # Only allow a trusted parameter "white list" through.
    def create_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
    end

    def update_user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest)
    end
  end
end
