require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it ' building は空でも登録できること' do
        @buyer. building = ""
        expect(@buyer).to be_valid
      end
      it '値が正しく入力されていれば登録できること' do
        expect(@buyer).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号の情報が空だと購入できない' do
        @buyer.post_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフン(-)がないと登録できない' do
        @buyer.post_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県の情報が空では登録できない' do
        @buyer.zone_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Zone must be other than 1")
      end
      it '市区町村の情報が空では登録できない' do
        @buyer.city = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @buyer.adress = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が空では登録できない' do
        @buyer.phone_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがある場合登録できない' do
        @buyer.phone_number = "-"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は12桁以上は登録できない' do
        @buyer.phone_number = "000000000000"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンの情報が空だと購入できない' do
        @buyer.token = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
