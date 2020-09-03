require 'rails_helper'
 
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/camera.png')
  end
  describe '商品出品機能' do
   context "商品出品機能がうまくいくとき" do
    it "全ての値が正しく入力されていていれば登録できること" do
      expect(@product).to be_valid
    end
   end
   context "新規登録がうまくいかないとき" do
    it "画像が空だったら登録できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空では登録できない" do
      @product.name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空では登録できない" do
      @product.description = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリーの情報が空では登録できない" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態についての情報が空では登録できない" do
      @product.status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Status must be other than 1")
    end
    it "配送料の負担についての情報が空では登録できない" do
      @product.cost_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Cost must be other than 1")
    end
    it "発送元の地域についての情報が空では登録できない" do
      @product.zone_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Zone must be other than 1")
    end
    it "発送までの日数についての情報が空では登録できない" do
      @product.days_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Days must be other than 1")
    end
    it "価格の情報が空では登録できない" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include( "Price can't be blank")
    end
    it "値段が300以下であれば登録できない" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "値段が1000000以上であれば登録できない" do
      @product.price = 100000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
   end
  end
end
