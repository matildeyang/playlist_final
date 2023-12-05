class UsersController < ApplicationController
  def index
    matching_songs = Users.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end
end 
