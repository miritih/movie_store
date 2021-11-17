module Api
  module V1
    class UsersController < ApiController

      #POST /users
      def create
        user = User.where(username: user_params[:username]).first
        if user
          render_response(user, UserSerializer)
        else
          @user = User.new(user_params)
          if @user.save
            render_response(@user, UserSerializer, 201)
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      end

      def destroy
        user = User.where(username: user_params[:username]).first
        if user
          user.destroy
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :role)
      end

    end
  end
end
