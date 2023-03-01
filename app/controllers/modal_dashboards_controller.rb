class ModalDashboardsController < ApplicationController
  def index
  end

  def test_view
  end

  def create_user
    # Create a new User object with the given parameters
    @user = User.new(user_params)

    # Attempt to save the new user record to the database
    if @user.save
      flash[:success] = "User successfully created!"
      redirect_to modal_dashboards_index_path
    else
      flash[:error] = "Error creating user"
      render :index
    end
  end

  def create_employment
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nick_name, :email, :phone_number)
    end
end
