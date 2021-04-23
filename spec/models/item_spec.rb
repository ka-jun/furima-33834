require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録/画像、商品名、商品の説明' do
    context '画像、商品名、商品の説明の登録ができないとき' do
      it '商品画像を1枚つけないと登録不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録不可' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと登録不可' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
    end
    context '画像、商品名、商品の説明の登録ができるとき' do
      it '商品画像を1枚つけると登録可' do
        expect(@item).to be_valid
      end
      it '商品名があれば登録可' do
        @item.name ='可愛い絵'
        expect(@item).to be_valid
      end
      it '商品説明があれば登録可' do
        @item.text ='新品の可愛い絵です'
        expect(@item).to be_valid
      end
    end
    context 'カテゴリ、商品の状態、配送料の負担、発送元地域、発送日数の登録ができないとき' do
      it 'カテゴリを選択しないと登録不可' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態を選択しないと登録不可' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担を選択しないと登録不可' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の情報を選択しないと登録不可' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数を選択しないと登録不可' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
    end
    context 'カテゴリ、商品の状態、配送料の負担、発送元地域、発送日数を洗濯していると登録ができる' do
      it 'カテゴリを選択すると登録可' do
        @item.category_id ='2'
        expect(@item).to be_valid
      end
      it '商品の状態を選択すると登録可' do
        @item.condition_id ='2'
        expect(@item).to be_valid
      end
      it '配送料の負担を選択すると登録可' do
        @item.shipping_charge_id ='2'
        expect(@item).to be_valid
      end
      it '発送元の情報を選択すると登録可' do
        @item.shipping_area_id ='2'
        expect(@item).to be_valid
      end
      it '発送までの日数を選択すると登録可' do
        @item.shipping_day_id ='2'
        expect(@item).to be_valid
      end
    end
    context '販売価格が登録不可の場合' do
      it '販売価格が空白だと登録不可' do
        @item.price = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Only numbers can be used.", "Price The number is invalid.")
      end
      it '販売価格に全角数字の入力だと登録不可' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price The number is invalid.")
      end
      it '販売価格に数字以外の文字入力だと登録不可' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price The number is invalid.")
      end
      it '販売価格が300円以内だと登録不可' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price The number is invalid.")
      end
      it '販売価格が9999999円以上だと登録不可' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price The number is invalid.")
      end
    end
    context '販売価格が登録可の場合' do
      it '販売価格が入力されている場合登録可' do
        @item.price ='1000'
        expect(@item).to be_valid
      end
      it '販売価格に半角数字が入力されていれば登録可' do
        @item.price ='1000'
        expect(@item).to be_valid
      end
      it '販売価格が300円以上だと登録可' do
        @item.price ='300'
        expect(@item).to be_valid
      end
      it '販売価格が9999999円以内だと登録可' do
        @item.price ='9999999'
        expect(@item).to be_valid
      end
    end
  end
end