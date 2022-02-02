require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "lastname_characterが空では登録できない" do
      @user.lastname_character = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname character can't be blank", "Lastname character is invalid. Input full-width characters.")
    end
    it "lastname_katakanaが空では登録できない" do
      @user.lastname_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana can't be blank", "Lastname katakana is invalid. Input full-width katakana characters.")
    end
    it "name_characterが空では登録できない" do
      @user.name_character = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name character can't be blank", "Name character is invalid. Input full-width characters.")
    end
    it "name_katakanaが空では登録できない" do
      @user.name_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name katakana can't be blank", "Name katakana is invalid. Input full-width katakana characters.")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "全ての項目が入力されていれば登録できる" do
      expect(@user).to be_valid
    end
    it "重複したemailは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@を含まない場合は登録できない" do
      @user.email = "cccgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが6文字未満では登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "英字のみのpasswordでは登録できない" do
      @user.password = "cccccccc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "数字のみのpasswordでは登録できない" do
      @user.password = "00000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "全角文字を含むpasswordでは登録できない" do
      @user.password = "ああああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it "passwordとpassword_confirmationが不一致だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "lastname_characterに半角文字が含まれていると登録できない" do
      @user.lastname_character = "ta中"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname character is invalid. Input full-width characters.")
    end
    it "name_characterに半角文字が含まれていると登録できない" do
      @user.name_character = "ta郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name character is invalid. Input full-width characters.")
    end
    it "lastname_katakanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.lastname_katakana = "タなka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana is invalid. Input full-width katakana characters.")
    end
    it "name_katakanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.name_katakana = "タろu"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name katakana is invalid. Input full-width katakana characters.")
    end
  end
end
