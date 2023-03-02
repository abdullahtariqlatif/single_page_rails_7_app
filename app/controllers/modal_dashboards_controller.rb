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
    ActiveRecord::Base.transaction do
      responses = params[:forms].map do |form_params|
                    # Create or update a record using the form parameters
                    @employment = Employment.find_or_initialize_by(id: form_params[:id])
                    if @employment.update(employment_params(form_params))
                      { status: :created, message: 'Record saved successfully', employment: @employment }
                    else
                      { status: :unprocessable_entity, errors: @employment.errors }
                    end
                  end

      # Check if any responses are errors
      if responses.any? { |response| response[:status] == :unprocessable_entity }
        render json: responses, status: :unprocessable_entity
      else
        render json: responses
      end
    end
  end

  def employment_form
    render partial: 'modal_dashboards/partials/employment_form'
  end

  # def initial_employment_form
  #   render partial: 'modal_dashboards/partials/initial_employment_form'
  # end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nick_name, :email, :phone_number)
    end

    # def employment_params
    #   params.require(:employment).permit(:employer_name, :employment_started_date, :employment_ended_date)
    # end

    def employment_params(form_params)
      form_params.permit(:employer_name, :employment_started_date, :employment_ended_date)
    end
end
