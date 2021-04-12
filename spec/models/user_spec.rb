require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録/ユーザー情報" do
    it "ニックネームが必須であること" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
      birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      user = User.new(nickname: "kasumi", email: "", password: "test123", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
    end
    it "パスワードが必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end
    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "te12", password_confirmation: "te12",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "testtest", password_confirmation: "testtest",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test1234",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "",first_name: "",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid", "First name can't be blank", "First name is invalid")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "tera",first_name: "k",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "", first_name_kana: "")
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid", "First name kana can't be blank", "First name kana is invalid")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
        birthday: "1992/05/01", last_name: "寺口",first_name: "加純",last_name_kana: "てらぐち", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "生年月日が必須であること" do
      user = User.new(nickname: "kasumi", email: "kkk@gmail.com", password: "test123", password_confirmation: "test123",
        birthday: "", last_name: "寺口",first_name: "加純",last_name_kana: "テラグチ", first_name_kana: "カスミ")
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
