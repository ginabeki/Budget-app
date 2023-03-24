class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups
    @user = current_user
  end

  def new
    @group = current_user.groups.build
    @user = current_user
  end

  def create
    @group = Group.new(group_params)
    @group = current_user.groups.build(group_params)

    if @group.valid? && @group.save
      redirect_to groups_path(current_user), notice: 'Category added successfully'
    else
      flash.now[:error] = 'Failed to add category'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :created_at)
  end
end
