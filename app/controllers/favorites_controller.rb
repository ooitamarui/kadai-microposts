class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    #@favorite = Favorite.new(
    @favorite = Micropost.find(params[:favorite][:micropost_id])
    #user_id: @current_user.id,
    current_user.favorite(@favorite)
    #micropost_id: params[:favorite][:micropost_id])
    #@favorite.save
    redirect_back(fallback_location: root_url)
#    redirect_to("/microposts/#{params[:post_id]}")
  end

  def destroy
    @favorite = Micropost.find(params[:favorite][:micropost_id])
    #user_id: @correct_user.id,micropost_id: params[:micropost_id])
    current_user.unfavorite(@favorite)
    redirect_back(fallback_location: root_url)
    #redirect_to("/microposts/#{params[:post_id]}")
  end

#likes一覧表示用  
  def likes
    @favorite = current_user.favorite_posts
  end
  
end