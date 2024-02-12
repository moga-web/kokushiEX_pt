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
    context 'ユーザー名が空だと登録できない' do
      subject(:user) { build(:user, username: nil) }
      it {is_expected.to be_invalid}
    end

    context 'メールアドレスが空だと登録できない' do
      subject(:user) { build(:user, email: nil) }
      it {is_expected.to be_invalid}
    end

    context 'メールアドレスが重複している場合' do
      subject(:user) { create(:user) }
      it '登録できない' do
        another_user = build(:user, email: user.email)
        expect(another_user).to be_invalid
      end
    end

    context 'パスワードが空だと登録できない' do
      subject(:user) { build(:user, password: nil) }
      it {is_expected.to be_invalid}
    end

    context 'パスワードが6文字未満だと登録できない' do
      subject(:user) { build(:user, password: 'abc') }
      it {is_expected.to be_invalid}
    end
  end
end
