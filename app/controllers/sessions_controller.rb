class SessionsController < ApplicationController
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
end 