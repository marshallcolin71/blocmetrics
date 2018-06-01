class RegisteredAppsController < ApplicationController
  def create
    @registeredapp = RegisteredApp.new(registered_app_params)
    @registeredapp.user = current_user

    if @registeredapp.save
      flash[:notice] = "You have successfully registered your app"
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was an unexpected error. Please try again."
      render :new
  end
end

def new
  @registeredapp = RegisteredApp.new
end

def show
  @registeredapp = RegisteredApp.find(params[:id])
  unless @ registeredapp.user == current_user
    flash[:alert] = "You are not authorized to use this app"
    redirect_to root_path
  end
end

def index
  @registeredapps = []
  @allapps = RegisteredApp.all
  @allapps.each do |app|
    if app.user == current_user
      @registeredapps << app
    end
  end
end

def edit
  @registeredapp = RegisteredApp.find(params[:id])
end

def update
  @registeredapp = RegisteredApp.find(params[:id])
  @registeredapp.name = params[:registeredapp][:name]
  @registeredapp.url = params[:registeredapp][:url]

  if @registeredapp.save
    flash[:notice] = "registered app was updated successfully"
    redirect_to @registeredapp
  else
    flash.now[:alert] = "There was an error updating the app. Please try again."
    render :edit
  end
end

private

def registered_app_params
  params.require(:registered_app).permit(:name, :url)
end
