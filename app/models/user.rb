class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         with_options presence: true do
            validates :name, length: { maximum: 20 }
            validates :email, uniqueness: {case_sensitive: true}, format: { with: VALID_EMAIL_REGEX }
            validates :password, length: {minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
            validates :birth_day
         end
       
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
          validates :family_name
          validates :first_name
       end
       with_options presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力してください"} do
          validates :family_name_kana
          validates :first_name_kana
       end
          
end