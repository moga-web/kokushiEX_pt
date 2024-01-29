# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  username               :string           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  context '正常系' do
    it 'ユーザー登録ができる' do
      expect(user).to be_valid
    end
  end

  context 'バリデーション' do
    it 'ユーザー名が空だと登録できない' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'メールアドレスが空だと登録できない' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'メールアドレスが重複していると登録できない' do
      user.save
      another_user = build(:user, email: user.email)
      expect(another_user).not_to be_valid
    end

    it 'パスワードが空だと登録できない' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'パスワードが6文字未満だと登録できない' do
      user.password = 'abc'
      expect(user).not_to be_valid
    end
  end
end
