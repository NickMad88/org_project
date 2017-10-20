class MembersController < ApplicationController

  def create
    @group = Group.find(params[:id])
    @group.user_members << current_user
    @group.save
    redirect_to groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.user_members.delete(User.find(current_user.id))
    redirect_to groups_path
  end
end
