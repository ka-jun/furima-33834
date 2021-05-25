require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
    sleep 0.05
  end
  describe '商品購入（正常系）' do
    context '配送先情報' do
      it 'すべての値が正しく入力されていれば登録可' do
        expect(@purchase_address).to be_valid
      end
      it '郵便番号ををハイフン付きで入力すると登録可' do
        @purchase_address.postal_code = '001-0001'
        expect(@purchase_address).to be_valid
      end
      it '都道府県を選択すると登録可' do
        @purchase_address.shipping_area_id = '2'
        expect(@purchase_address).to be_valid
      end
      it '市区町村を入力すると登録可' do
        @purchase_address.city = '札幌市'
        expect(@purchase_address).to be_valid
      end
      it '番地を入力すると登録可' do
        @purchase_address.home_number = '1-2-3'
        expect(@purchase_address).to be_valid
      end
      it '番地は空でも登録可' do
        @purchase_address.home_number = ''
        expect(@purchase_address).to be_valid
      end
      it '電話番号を10桁入力すると登録可' do
        @purchase_address.tel = '09012345678'
        expect(@purchase_address).to be_valid
      end
      it '電話番号を11桁入力すると登録可' do
        @purchase_address.tel = '09012345678'
        expect(@purchase_address).to be_valid
      end
      it 'トークンが生成されれば登録可' do
        @purchase_address.token = 'tok_abcdefghijk00000000000000000'
        expect(@purchase_address).to be_valid
      end
    end
    describe '商品購入（異常系）' do
      context '配送先情報' do
        it '郵便番号が必須' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank",
                                                                    'Postal code is invalid. Include hyphen(-)')
        end
        it '郵便番号の保存にはハイフンがないと登録不可' do
          @purchase_address.postal_code = '0011234'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it '郵便番号の保存には(数字3桁)（ハイフン）（数字4桁）でないと登録不可' do
          @purchase_address.postal_code = '0-111111'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it '都道府県が必須' do
          @purchase_address.shipping_area_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
        end
        it '市区町村が必須' do
          @purchase_address.city = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it '電話番号が必須' do
          @purchase_address.tel = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel can't be blank", 'Tel Phone number Input only number')
        end
        it '電話番号は1２桁以上の数値は登録不可' do
          @purchase_address.tel = '111111111111'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Tel Phone number Input only number')
        end
        it '電話番号は９桁未満の数値は登録不可' do
          @purchase_address.tel = '111111111'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Tel Phone number Input only number')
        end
        it '電話番号は英数混合では登録できないこと' do
          @purchase_address.tel = '090abcdefgh'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel Phone number Input only number")
        end
        it 'トークンが空の場合登録不可' do
          @purchase_address.token = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では登録できないこと' do
          @purchase_address.user_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できないこと' do
          @purchase_address.item_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end

        it '発送元の地域で「−−」を選択した場合登録不可' do
          @purchase_address.shipping_area_id = '1'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Shipping area must be other than 1")
        end
      end
    end
  end
end
