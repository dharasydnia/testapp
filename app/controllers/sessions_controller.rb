class SessionsController < ApplicationController
  def index
  end

  def new
    @session = UserSession.new
		redirect_to root_path if current_user
	end

	def create
    @session = UserSession.new(params[:user_session])

    if @session.valid? and @session.auth
      Rails.logger.info "XXX success!"
      user = User.find_or_create(@session.auth)
      session[:user_id] = user.id
      redirect_back_or_default root_path
    else
      Rails.logger.info "XXX failure!"
      render :action => :new
    end
	end

  def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end
