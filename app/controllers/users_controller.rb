class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show 
    @id = params.fetch("id")
    @the_user = User.where(id: @id).first

    if @the_user == nil
      redirect_to("/404")
    else
      render(template: "users/show")
    end
  end 
end 
