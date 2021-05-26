class UsersController < ApplicationController
  def index
    @user = User.all
    @fashions = Fashion.all
    @fashion = Fashion.new
  end

  def show
    @user = User.find(params[:id])
    @fashion = Fashion.new
    @fashions = @user.fashions
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'fashion was successfully updated.'
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def search
  redirect_to users_path if params[:keyword] == ""

  split_keyword = params[:keyword].split(/[[:blank:]]+/)

  users = []
    split_keyword.each do |keyword|  # 分割したキーワードごとに検索
      next if keyword == ""
      users << User.where('name LIKE(?)', "%#{keyword}%").pluck('id') # 部分一致で検索
    end

    # @user = User.all
    @user = User.where(id: users.flatten).page(params[:page]).reverse_order.per(9)
    @fashions = Fashion.all
    @fashion = Fashion.new

    render action: :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
