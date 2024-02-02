require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_up" do
    it "ユーザー登録画面が表示される" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users/sign_up" do
    context '正常系' do
      it 'ユーザー登録ができる' do
        user_params = { user: { username: 'newuser', email: 'newuser@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(dashbord_path) 
      end
    end

    context '不正なパラメータの場合' do
      it 'ユーザー登録ができない' do
        user_params = { user: { username: '', email: 'user@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.not_to change(User, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /users/sign_in" do
    it "ログイン画面が表示される" do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users/sign_in" do
    let!(:user) { create(:user, email: 'user@example.com', password: 'password') }

    context '正常系' do
      it 'ログインができる' do
        post user_session_path, params: { user: { email: 'user@example.com', password: 'password' } }
        expect(response).to redirect_to(dashbord_path)
      end
    end

    context '不正なパラメータの場合' do
      it 'ログインができない' do
        post user_session_path, params: { user: { email: 'user@example.com', password: 'incorrect' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /users/edit" do
    before do
      user = FactoryBot.create(:user)
      sign_in user
    end
    it "ユーザー編集画面が表示される" do
      get edit_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /users/edit" do
    before do
      @user = create(:user)
      login_as(@user, scope: :user)
    end

    it "ユーザー情報が更新される" do
      patch user_registration_path, params: { user: { email: 'updated@example.com' } }
      expect(response).to redirect_to(edit_user_registration_path) 
      expect(@user.reload.email).to eq 'updated@example.com'
    end
  end
end


