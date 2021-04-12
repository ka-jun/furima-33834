require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録/ユーザー情報" do
    it "ニックネームが必須であること" do
      user = FactoryBot.build(:user)
      user.nickname = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      user = FactoryBot.build(:user)
      user.save
      user2 = FactoryBot.build(:user)
      user2.email = 'kkk@gmail.com'
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが必須であること" do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end
    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      user = FactoryBot.build(:user)
      user.password = 'te12'
      user.password_confirmation = 'te12'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
      user = FactoryBot.build(:user)
      user.password = '000000'
      user.password = 'aaaaaa'
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      user = FactoryBot.build(:user)
      user.password = 'test123'
      user.password_confirmation =''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid", "First name can't be blank", "First name is invalid")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.last_name = 'teraguchi'
      user.first_name = 'kasumi'
      user.last_name = '123'
      user.first_name = '456'
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.last_name_kana =''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid", "First name kana can't be blank", "First name kana is invalid")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.first_name_kana = 'てらぐち'
      user.last_name_kana ='かすみ'
      user.first_name_kana = 'teraguchi'
      user.last_name_kana ='kasumi'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "生年月日が必須であること" do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
