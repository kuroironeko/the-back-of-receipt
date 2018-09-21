class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy join]
  before_action :admin_user, except: %i[index create new join]
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups
  def create
    @group = Group.new(group_params)
    if @group.save
      @user = current_user
      @user.admin = true
      @user.group_id = @group.id
      @user.save
      redirect_to groups_path, notice: t(:success_create)
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: t(:success_update)
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    @user = current_user
    @user.group_id = nil
    @user.admin = false
    @user.save
    redirect_to groups_url, notice: t(:success_destroy)
  end

  def join
    @user = current_user
    @user.request_group = @group.id
    @user.save
    redirect_to groups_url, notice: t(:success_join_request)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name)
  end

  def admin_user
    redirect_to(root_url) if !current_user.admin? || current_user.group_id != params[:id].to_i
  end
end
