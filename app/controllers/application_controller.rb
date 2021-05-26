class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def search
    @fashion = Fashion.new
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    tag = Tag.find(params[:tag])  #クリックしたタグを取得
    @fashions = tag.fashions.all.page(params[:page]).reverse_order.per(9) #クリックしたタグに紐付けられた投稿を全て表示
    @user = User.all
    render template: "fashions/index.html.erb"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
