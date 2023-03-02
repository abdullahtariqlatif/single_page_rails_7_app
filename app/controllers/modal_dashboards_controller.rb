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
      respond_to do |format|
        format.js { render json: { status: :created, message: 'Record saved successfully', user: @user } }
      end
    else
      respond_to do |format|
        format.js { render json: { status: :unprocessable_entity, errors: @user.errors } }
      end
    end
  end

  def create_employment
    # Create a new Employment object with the given parameters
    @employment = Employment.new(employment_params)

    # Attempt to save the new employment record to the database
    if @employment.save
      respond_to do |format|
        format.js { render json: { status: :created, message: 'Record saved successfully', user: @employment } }
      end
    else
      respond_to do |format|
        format.js { render json: { status: :unprocessable_entity, errors: @employment.errors } }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nick_name, :email, :phone_number)
    end

    def employment_params
      params.require(:employment).permit(:employer_name, :employment_started_date, :employment_ended_date)
    end
end
