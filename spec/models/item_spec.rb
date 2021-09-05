require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品の出品ができる場合' do
      it '項目が全て入力されている場合' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品名が空の場合' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end     
      it '商品説明が空の場合' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it '値段が空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '商品画像が空の場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'カテゴリーが選択されていない場合' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '送料負担が選択されていない場合' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it '商品状態が選択されていない場合' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '発送までの日数が選択されていない場合' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it '発送元地域が選択されていない場合' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end
