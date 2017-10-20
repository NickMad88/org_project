class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(name:group_helper[:name],description:group_helper[:description], user:current_user)
    @group.user_members << current_user
    if @group.save
      redirect_to groups_path
    else
      flash[:errors] = @group.errors.full_messages
      redirect_to groups_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if current_user.id == @group.user.id
      @group.delete
      redirect_to groups_path
    else
      flash[:errors] = ["Only the creator can delete a group!"]
      redirect_to groups_path
    end
  end

  private

  def group_helper
    params.require(:group).permit(:name,:description) if params[:group].present?
  end

end
