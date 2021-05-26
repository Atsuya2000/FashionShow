class FashionsController < ApplicationController
  def new
    @fashion = Fashion.new
  end

  def create
    @fashion = Fashion.new(fashion_params)
    tag_list = params[:fashion][:tag_name].split(nil)
    @fashion.user = current_user
    if @fashion.save
      @fashion.save_tag(tag_list)
      flash[:notice] = 'You have created fashion successfully.'
       redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def index
    @tag_list = Tag.all
    @fashion = Fashion.new
    @fashions = Fashion.page(params[:page]).reverse_order.per(9)
    @user = User.all
  end

  def show
    @fashion = Fashion.find(params[:id])
    @fashion_new = Fashion.new
    @fashion_comment = FashionComment.new
    @fashion_tags = @fashion.tags
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
    tag_list = params[:fashion][:tag_name].split(nil)
    if @fashion.update(fashion_params)
      @fashion.save_tag(tag_list)
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

  def search
  redirect_to fashions_path if params[:keyword] == ""

  split_keyword = params[:keyword].split(/[[:blank:]]+/)

  fashions = []
    split_keyword.each do |keyword|  # 分割したキーワードごとに検索
      next if keyword == ""
      fashions << Fashion.where('introduction LIKE(?)', "%#{keyword}%").pluck('id') # 部分一致で検索
    end

    @tag_list = Tag.all
    @fashion = Fashion.new
    @fashions = Fashion.where(id: fashions.flatten).page(params[:page]).reverse_order.per(9)
    @user = User.all

    render action: :index
  end

  private
  def fashion_params
    params.require(:fashion).permit(:introduction, fashion_images_images: [])
  end
end
