require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "lastname_characterが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Lastname character can't be blank", "Lastname character is invalid. Input full-width characters.")
    end
    it "lastname_katakanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"", name_character:"田中", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Lastname katakana can't be blank", "Lastname katakana is invalid. Input full-width katakana characters.")
    end
    it "name_characterが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"", name_katakana:"タナカ", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Name character can't be blank", "Name character is invalid. Input full-width characters.")
    end
    it "name_katakanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"", birthday:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Name katakana can't be blank", "Name katakana is invalid. Input full-width katakana characters.")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "abe", email: "ccc@gmail.com", password: "00000000", password_confirmation: "00000000", lastname_character:"太郎", lastname_katakana:"タロウ", name_character:"田中", name_katakana:"タナカ", birthday:"")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
