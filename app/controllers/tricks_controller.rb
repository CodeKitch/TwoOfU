class TricksController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @trick = @user.tricks.build
    else
      @trick = Trick.new
    end
    @trick.build_category
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
       @tricks = @user.tricks.alpha
    else
      @error = "That user doesn't exist" if params[:user_id]
      @tricks = Trick.alpha.includes(:category, :user)
    end

    @tricks = @tricks.search(params[:q].downcase) if params[:q] && !params[:q].empty?
    @tricks = @tricks.filter(params[:trick][:category_id]) if params[:trick] && params[:trick][:category_id] != ""

  end

  def create
    @trick = current_user.tricks.build(trick_params)
    if @trick.save
      redirect_to tricks_path
    else
      render :new
    end
  end

  def edit
    @trick = Trick.find_by_id(params[:id])
    redirect_to tricks_path if !@trick || @trick.user != current_user
    @trick.build_category if !@trick.category
  end

  def update
     @trick = Trick.find_by(id: params[:id])
     redirect_to tricks_path if !@trick || @trick.user != current_user
    if @trick.update(trick_params)
      redirect_to trick_path(@trick)
    else
      render :edit
    end
  end

  def show
    @trick = Trick.find_by_id(params[:id])
    redirect_to tricks_path if !@trick
  end

  def destroy
    @trick = Trick.find_by_id(params[:id])
    @trick.destroy
    redirect_to tricks_path
  end

  private

  def trick_params
    params.require(:trick).permit(:name, :category_id, :category, category_attributes: [:ilk])
  end

end