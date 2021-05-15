require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入（正常系）' do
    context '配送先情報' do
      it '郵便番号ををハイフン付きで入力すると登録可' do
        @address.postal_code = '001-1234'
        expect(@address).to be_valid
      end
      it '都道府県を選択すると登録可' do
        @address.shipping_area_id = '2'
        expect(@address).to be_valid
      end
      it '市区町村を入力すると登録可' do
        @address.city = '札幌市'
        expect(@address).to be_valid
      end
      it '番地を入力すると登録可' do
        @address.home_number = '1-2-3'
        expect(@address).to be_valid
      end
      it '電話番号を10桁入力すると登録可' do
        @address.tel = '09012345678'
        expect(@address).to be_valid
      end
      it '電話番号を11桁入力すると登録可' do
        @address.tel = '09012345678'
        expect(@address).to be_valid
      end
    end
  end
  describe '商品購入（異常系）' do
    context '配送先情報' do
      it '郵便番号が必須' do
        @address.postal_code = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Purchase must exist")
      end
      it '都道府県が必須' do
        @address.shipping_area_id = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Purchase must exist")
      end
      it '市区町村が必須' do
        @address.city = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
      it '番地が必須' do
        @address.home_number = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
      it '電話番号が必須' do
        @address.tel = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
      it '郵便番号の保存にはハイフンがないと登録不可' do
        @address.postal_code = ''
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
      it '電話番号は1２桁以上の数値は登録不可' do
        @address.image = '111111111111'
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
      it '電話番号は９桁未満の数値は登録不可' do
        @address.image = '111111111'
        @address.valid?
        binding.pry
        # expect(@address.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
