require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
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
    it 'passwordが空では登録できない'do
    user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '', birthday: '2000-11-11', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
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
  end
end
