module Api::V1
  class UsersController < ApplicationController
    before_action :authorize!, except: [:create, :login]

    # POST /users
    def create
      user = User.new(create_user_params)

      if user.save
        head :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/profile
    def destroy_profile
      current_user.destroy
      logout
      render :ok
    end

    # POST /users/login
    def login
      user = User.where(email: login_params[:email]).first

      if user && user.authenticate(login_params[:password])
        token = encode_token({user_id: user.id.to_s})
        render json: {user: serialize_user(user), token: token}, status: :ok
      else
        head :unauthorized
      end
    end

    # GET /users/profile
    def show_profile
      render json: current_user, status: :ok
    end

    # PATCH/PUT /users/profile
    def update_profile
      if current_user.update(update_user_params)
        render :ok
      else
        render json: current_user.errors, status: :unprocessable_entity
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def create_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def update_user_params
      params.require(:user).permit(:first_name, :last_name, :password)
    end

    def login_params
      params.require(:user).permit(:email, :password)
    end

    def serialize_user(user)
      UserSerializer.new(user).attributes
    end
  end
end
