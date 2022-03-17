require 'rails_helper'

RSpec.describe ProductPurchase, type: :model do
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product, user_id: user.id)
      @product_purchase = FactoryBot.build(:product_purchase, user_id: user.id, product_id: product.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@product_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @product_purchase.building_name = ""
        expect(@product_purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @product_purchase.postal_code = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」でないと保存できないこと' do
        @product_purchase.postal_code = '00-1010'
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角文字列でないと保存できないこと' do
        @product_purchase.postal_code = 'おをををを'
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'ship_from_idを選択していないと保存できないこと' do
        @product_purchase.ship_from_id = 1
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Ship from can't be blank")
      end
      it 'cityを選択していないと保存できないこと' do
        @product_purchase.city= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @product_purchase.house_number= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numbeが空だと保存できないこと' do
        @product_purchase.telephone_number= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
      it 'telephone_numberが9桁以内だと保存できないこと' do
        @product_purchase.telephone_number= "111111111"
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @product_purchase.telephone_number= "111111111111"
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数値でないと保存できないこと' do
        @product_purchase.telephone_number= "１２３４５６７８９０"
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @product_purchase.token= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていなければ保存できないこと' do
        @product_purchase.user_id= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐づいていなければ保存できないこと' do
        @product_purchase.product_id= ""
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end