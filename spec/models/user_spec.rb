require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname: '', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        user = User.new(nickname: 'test', email: '', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
        it 'emailが既に存在していると登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.save
        after_user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        after_user.valid?
        expect(after_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'email＠が無いと登録できない' do
        user = User.new(nickname: 'test', email: 'asdfsample.com', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない'do
        user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録できない'do
        user = User.new(nickname: 'test', email: 'test@example', password: '12345', password_confirmation: '12345', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが一致していないと登録できない'do
        user = User.new(nickname: 'test', email: 'test@example', password: '123456', password_confirmation: '123457', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '誕生日が空では登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '苗字が空では登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が空では登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字（カナ）が空では登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: '', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前（カナ）が空では登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: '')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字（カナ）がカナでは無い時登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: '山田', first_name_kana: 'タロウ')
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '名前（カナ）がカナでは無い時登録できない' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: '太郎')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid")
      end
    end
    context '新規登録できるとき' do
      it '全て入力されていれば登録できる' do
        user = User.new(nickname: 'test', email: 'test@example', password: 'A1A1A1', password_confirmation: 'A1A1A1', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
        expect(user).to be_valid
      end
    end
  end
end
