class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:create, :new]
  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Iniciado sesion con exito'
      redirect_to root_path
    else
      flash.now[:alert] = 'Hubo un error con tus credenciales'
      render 'new'
    end
  end

  # cuando cierras sesion se destruye la sesion
  def destroy
    session[:user_id] = nil
    flash[:success] = "Se ha cerrado la sesión"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'Ya has iniciado sesion'
      redirect_to root_path
    end
  end
end 