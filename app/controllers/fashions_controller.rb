class FashionsController < ApplicationController
  def new
    @fashion = Fashion.new
  end

  def create
    @fashion = Fashion.new(fashion_params)
    @fashion.user = current_user
    if @fashion.save
      flash[:notice] = 'You have created fashion successfully.'
       redirect_to fashion_path(@fashion.id)
    else
      @fashions = Fashion.all
      @user = current_user
      render :index
    end
  end

  def index
    @fashion = Fashion.new
    @fashions = Fashion.page(params[:page]).reverse_order
    @user = User.all
  end

  def show
    @fashion = Fashion.find(params[:id])
    @fashion_new = Fashion.new
    @fashion_comment = FashionComment.new
  end

  def edit
    @fashion = Fashion.find(params[:id])
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
       redirect_to fashion_path(@fashion.id)
    else
       render :edit
    end
  end

  def destroy
    @fashion = Fashion.find(params[:id])
    @fashion.destroy
    redirect_to fashions_path
  end

  private
  def fashion_params
    params.require(:fashion).permit(:name, :introduction, :image)
  end
end
