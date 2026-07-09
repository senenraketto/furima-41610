require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'token（カード情報）が空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Token を入力してください')
      end
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code を入力してください')
      end
      it 'postal_codeが「3桁ハイフン4桁」の形式でないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code はハイフン（-）を含めて入力してください')
      end
      it 'prefecture_idを選択していない（値が1の場合）保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('City を入力してください')
      end
      it 'addressesが空だと保存できない' do
        @order_address.address = ''  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Address を入力してください')
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number を入力してください')
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'phone_numberに半角数字以外（ハイフンなど）が含まれていると保存できない' do
        @order_address.phone_number = '090-1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('User を入力してください')
      end
      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Item を入力してください')
      end
    end
  end
end