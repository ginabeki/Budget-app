class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:group_id].present?
      @group = Group.find(params[:group_id])
      @group_expenses = GroupExpense
        .includes(:expense)
        .where(group_id: params[:group_id])
        .order(created_at: :desc)

      @total_amount = @group_expenses.sum { |trans| trans.expense.amount }

      render 'index', group: @group, total_amount: @total_amount
    else
      @expenses = Expense.where(author_id: current_user.id)
      render 'index', expenses: @expenses
    end
  end

  def new
    @groups = Group.where(author_id: current_user.id)
    @groups = @groups.map do |group|
      [group.name, group.id]
    end
    render 'new'
  end

  def create
    name = params[:expense][:name]
    amount = params[:expense][:amount]
    group_id = params[:expense][:group]
    expense = Expense.create(name:, amount:, author_id: current_user.id)
    group_expense = GroupExpense.create(group_id:, expense_id: expense.id)
    if expense.save && group_expense.save
      flash[:success] = 'Group saved successfully'
      redirect_to groups_path
    else
      @groups = Group.where(author_id: current_user.id)
      @groups = @groups.map do |group|
        [group.name, group.id]
      end
      flash[:error] = 'Group couldn`t be saved'
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category)
  end
end
