class DogsController < ApplicationController
  respond_to :html

  def new
    @dog = Dog.new
    render(partial: 'new')
  end

  def create
    @dog = Dog.create(dog_parameters)
    render(partial: 'show')
  end

  def show
    @dog = Dog.find(params[:id])
    render(partial: 'show')
  end

  def edit
    @dog = Dog.find(params[:id])
    render(partial: 'edit')
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update_attributes(dog_parameters)
    render(partial: 'show')
  end

  def destroy
    Dog.destroy(params[:id])
    render(partial: 'index', locals: {dogs: Dog.all})
  end

  def index
    @dogs = Dog.all
  end

  private
  def dog_parameters
    params.require(:dog).permit(:name, :breed)
  end
end
