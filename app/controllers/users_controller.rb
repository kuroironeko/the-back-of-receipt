class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, except: [:index, :create, :new, :show, :edit, :update]
  before_action :set_user, only: %i[show edit update accept]
  def index
    @users = User.all.where(group_id: current_user.group_id)
    @request_users = User.all.where(request_group: current_user.group_id)
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :edit
    end
  end

  def accept
    @user.group_id = current_user.group_id
    @user.admin = false
    @user.request_group = nil 
    if @user.save
      redirect_to groups_url, notice: 'user was successfully accepted.'
    else
      render :index
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def admin_user
      redirect_to(root_url) if !current_user.admin? || !(current_user.group_id == params[:id].to_i)
    end
end
