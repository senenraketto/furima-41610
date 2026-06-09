class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class ApplicationController < ActionController::Base
  # 🟢 Deviseのコントローラーが動くとき、事前にパラメータを許可するメソッドを動かします
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # 🟢 新規登録（sign_up）のときに、追加したカスタムカラムの受け取りを許可します
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date])
  end
end
