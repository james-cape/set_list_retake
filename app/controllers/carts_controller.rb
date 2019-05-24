class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @song = Song.find(params[:song_id]) # ask model for song
    # @cart = Cart.new(session[:cart])
    @cart.add(@song.id)
    session[:cart] = @cart.contents
    # song_id_str = @song.id.to_s # turn song id to string
    # session[:cart] ||= Hash.new(0) # create cart session
    # # session[:cart] ||= {}
    # session[:cart][song_id_str] ||= 0 # create space for a new item in cart
    # session[:cart][song_id_str] += 1 # adding info to the cart session
    flash[:message] = "You now have #{pluralize(session[:cart][@song.id.to_s], 'copy')} of #{@song.title} in your cart."
    redirect_to songs_path # Redirecting
  end

  def show
  end
end
