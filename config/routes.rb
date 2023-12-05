Rails.application.routes.draw do
  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  get("/favorites/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Song resource:

  # CREATE
  post("/insert_song", { :controller => "songs", :action => "create" })
          
  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  
  get("/songs/:path_id", { :controller => "songs", :action => "show" })
  
  # UPDATE
  
  post("/modify_song/:path_id", { :controller => "songs", :action => "update" })
  
  # DELETE
  get("/delete_song/:path_id", { :controller => "songs", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get("/users/:id", {:controller => "users", :action => "show"})
end
