require_relative '../../lib/controller_base'
require_relative '../models/artist'

class ArtistsController < ControllerBase
  protect_from_forgery

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params["artist"])
    if @artist.save
      redirect_to "/"
    else
      flash.now[:errors] = @artist.errors
      render :new
    end
  end

  def update

  end

  def destroy

  end
end
