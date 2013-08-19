class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_parameters)

    respond_with(@dog)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update_attributes(dog_parameters)
    respond_with(@dog)
  end

  def destroy
    @dog = Dog.destroy(params[:id])
    respond_with(@dog)
  end

  def index
    @dogs = Dog.all
  end

  private
  def dog_parameters
    params.require(:dog).permit(:name, :breed)
  end
end
