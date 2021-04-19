require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録/画像、商品名、商品の説明' do
    context '画像、商品名、商品の説明の登録ができないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = ''
        @item.valid?
        # expect(@item.errors.full_messages).to include(