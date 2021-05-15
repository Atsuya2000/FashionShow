class FashionsController < ApplicationController
  def new
    @fashion = Fashion.new
  end

  def create
    @fashion = Fashion.new(fashion_params)
    @fashion.user = current_user
    if @fashion.save
      flash[:notice] = 'You have created fashion successfully.'
       redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def index
    @fashion = Fashion.new
    @fashions = Fashion.page(params[:page]).reverse_order.per(9)
    @user = User.all
  end

  def show
    @fashion = Fashion.find(params[:id])
    @fashion_new = Fashion.new
    @fashion_comment = FashionComment.new
  end

  def edit
    @fashion = Fashion.find(params[:id])
    @fashion.fashion_images.build
    if @fashion.user == current_user
      render :edit
    else
      redirect_to fashions_path
    end
  end

  def update
    @fashion = Fashion.find(params[:id])
    if @fashion.update(fashion_params)
       flash[:notice] = 'fashion was successfully updated.'
       redirect_to user_path(current_user.id)
    else
       render :edit
    end
  end

  def destroy
    @fashion = Fashion.find(params[:id])
    @fashion.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def fashion_params
    params.require(:fashion).permit(:introduction, fashion_images_images: [])
  end
end
