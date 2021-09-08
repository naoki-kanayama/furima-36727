require 'rails_helper'

RSpec.describe RecordDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_destination = FactoryBot.build(:record_destination, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '購入できる時' do
      it '項目が全て入力されているとき' do
        expect(@record_destination).to be_valid
      end
      it '建物名が空のとき' do
        @record_destination.building_number = ''
        expect(@record_destination).to be_valid
      end
    end
    context '購入できない時' do
      it '郵便番号が空のとき' do
        @record_destination.address_number = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Address number can't be blank"
      end
      it '都道府県が選択されていないとき' do
        @record_destination.prefecture_id = 1
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町区村が空のとき' do
        @record_destination.city = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空のとき' do
        @record_destination.address = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空のとき' do
        @record_destination.tel_number = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Tel number can't be blank"
      end
      it '郵便番号にハイフンが含まれていないとき' do
        @record_destination.address_number = '1234567'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Address number is invalid. Include hyphen(-). Enter half-width"
      end
      it '郵便番号が全角で入力されているとき' do
        @record_destination.address_number = '１２３−４５６７'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Address number is invalid. Include hyphen(-). Enter half-width"
      end
      it '電話番号にハイフンが含まれているとき' do
        @record_destination.tel_number = '090-1234-5678'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Tel number is invalid Not include hyphen(-). Enter half-width"
      end
      it '電話番号が全角で入力されているとき' do
        @record_destination.tel_number = '０９０１２３４５６７８'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Tel number is invalid Not include hyphen(-). Enter half-width"
      end
      it '郵便番号の桁数が７桁でないとき' do
        @record_destination.address_number = '1234-5678'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Address number is invalid. Include hyphen(-). Enter half-width"
      end
      it '電話番号の桁数が１０桁または１１桁でないとき' do
        @record_destination.tel_number = '09001234567890'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Tel number is invalid Not include hyphen(-). Enter half-width"
      end
      it 'tokenが空のとき（クレジットカード情報が入力されていないとき）' do
        @record_destination.token = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
