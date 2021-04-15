require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      user2 = FactoryBot.build(:user)
      user2.email = @user.email
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaacom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid',
                                                    "Password confirmation doesn't match Password")
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = 'te12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（passwordが英語のみでは登録できないこと）' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（passwordが数字のみでは登録できないこと）' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（passwordが全角では登録できないこと）' do
      @user.password ='ｔｅｓｔ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = 'test123'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = 'testtest222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.last_name = 'teraguchi'
      @user.last_name = '123'
      @user.last_name_kana = ''
      @user.last_name_kana = 'かすみ'
      @user.last_name_kana = 'kasumi'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid", "Last name kana is invalid")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.first_name = 'kasumi'
      @user.first_name = '456'
      @user.first_name_kana = ''
      @user.first_name_kana = 'てらぐち'
      @user.first_name_kana = 'teraguchi'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "First name kana is invalid")
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
