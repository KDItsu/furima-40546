require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    # 数字がIdに入っている
  end
  describe '商品購入情報の登録' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと登録できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んでいない形式だと登録できない' do
        @order_form.postal_code = '1231231'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが"---"では登録できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと登録できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値のみでないと登録できない' do
        @order_form.phone_number = '0901234567８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number.')
      end
      it 'phone_numberが9桁以下だと登録できない' do
        @order_form.phone_number = '09012345'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number.")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order_form.phone_number = '090123455465767'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number.")
      end
      it 'tokenが空だと登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end