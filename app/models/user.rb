class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションREADME.mdに書いている 実装ごとに書く
  # ユーザー情報
  validates :nickname, presence: true
  validates :birth_date, presence: true

  #  名前(全角)のバリデーション
  # （全角のひらがな、カタカナ、漢字のみを許可する正規表現）
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  # 正規表現 カタカナ用
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角（カタカナ）で入力してください' }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角（カタカナ）で入力してください' }

  # パスワード
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }, if: :password_required?
end
