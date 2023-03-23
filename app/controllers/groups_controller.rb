class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    # Retrieve all categories from the database
    @groups = current_user.groups
    @user = current_user
  end

  def show
    # Retrieve the category based on the provided ID
    @group = current_user.groups.find(params[:id])
    # Retrieve all transactions belonging to the category
    @expenses = @group.expenses
  end

  def new
    # Create a new instance of the Group model
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
