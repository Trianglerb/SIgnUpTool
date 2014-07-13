class SignUpsController < ApplicationController
  def index
    @sign_ups = SignUp.all.order(:created_at)
  end

  def new
    @sign_up = SignUp.new
  end

  def create
    @sign_up = SignUp.new(sign_up_params)
    if @sign_up.save
      flash[:success] = 'Successfully Signed Up'
      redirect_to root_path
    else
      flash[:error] = @sign_up.errors.full_messages
      render :new
    end
  end

  private
  def sign_up_params
    params[:sign_up].permit(:first_name, :last_name, :email, :subject)
  end
end
