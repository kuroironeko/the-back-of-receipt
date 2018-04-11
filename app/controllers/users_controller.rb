class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  # GET /products/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
