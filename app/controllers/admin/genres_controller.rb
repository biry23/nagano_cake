class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  
  def create
  end

  def edit
    @genre = Genre.find(parames[:id])
  end
  
  def update
  end

end
