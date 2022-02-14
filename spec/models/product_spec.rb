require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "商品出品機能" do
    before do
      user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product, user_id: user.id)
    end


    context '商品の出品ができるとき' do
      it "商品の情報を全て入力" do
        expect(@product).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it "画像がない商品の出品ができない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がない商品の出品ができない" do
        @product.name_products = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name products can't be blank")
      end
      it "商品の説明がない商品の出品ができない" do
        @product.explanation = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーに「--」が選択されている場合は商品の出品ができない" do
        @product.category_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態に「--」が選択されている場合は商品の出品ができない" do
        @product.condition_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担に「--」が選択されている場合は商品の出品ができない" do
        @product.delivery_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery can't be blank")
      end
      it "発送元の地域に「--」が選択されている場合は商品の出品ができない" do
        @product.ship_day_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship day can't be blank")
      end
      it "発送までの日数に「--」が選択されている場合は商品の出品ができない" do
        @product.ship_from_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship from can't be blank")
      end
      it "価格の入力がない商品の出品ができない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is invalid")
      end
      it "価格の入力が全角数字だと商品の出品ができない" do
        @product.price = "５００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it "価格の入力が300円未満だと商品の出品ができない" do
        @product.price = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it "価格の入力が10,000,000円以上だと商品の出品ができない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it "商品名が41文字以上は商品の出品ができない" do
        @product.name_products = "a" * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Name products is too long (maximum is 40 characters)")
      end
      it "商品説明が1001文字以上は商品の出品ができない" do
        @product.explanation = "a" * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @product.user_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end