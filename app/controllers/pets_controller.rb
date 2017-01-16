class PetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_pet, only: [:show, :edit, :update]


  def index
    @pets = Pet.includes(:user).all.order('id DESC')
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(create_params)
  end

  def edit
  end

  def update
    if @pet.user_id == current_user.id
      @pet.update(update_params)
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    if pet.user_id == current_user.id
      pet.destroy
    end
  end


  private

  def move_to_index
    redirect_to action: :index unless user_signed_in? && (current_user.seller_or_buyer == 1)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def create_params
    params.require(:pet).permit(:name, :breed, :birth_day, :image_url).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:pet).permit(:name, :breed, :image_url)
  end
end
