class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_parameters)
    if(@dog.save)
      redirect_to(dogs_path)
    else
      render(:new)
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if (@dog.update_attributes(dog_parameters))
      redirect_to(dogs_path)
    else
      render(:edit)
    end
  end

  def destroy
    @dog = Dog.destroy(params[:id])
    redirect_to(dogs_path)
  end

  def index
    @dogs = Dog.all
  end

  private
  def dog_parameters
    params.require(:dog).permit(:name, :breed)
  end
end
