# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    users_my_page_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to users_my_page_path, notice: "ゲストユーザーとしてログインしました。"
  end
  private
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :encrypted_password) }
  end
  # アクティブであるかを判断するメソッド
  def user_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    user = User.find_by(email: params[:user][:email])
    # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if user.nil?
    # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    flash.now[:error] = 'パスワードが間違っています'
    return unless user.valid_password?(params[:user][:password])
    # 【処理内容4】 アクティブでない会員に対する処理
    flash[:success] = 'ログインに成功しました'
    return if user.is_active == true

    if user.is_active == false
      flash[:error] = 'このユーザーは退会済みのためログインできません'
      redirect_to new_user_session_path
    end
  end

end
