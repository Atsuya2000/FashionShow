# require 'rails_helper'

# describe '[STEP3] 仕上げのテスト' do
#   let(:user) { create(:user) }
#   let!(:other_user) { create(:user) }
#   let!(:fashion) { create(:fashion, user: user) }
#   let!(:other_fashion) { create(:fashion, user: other_user) }

#   describe 'サクセスメッセージのテスト' do
#     subject { page }

#     it 'ユーザ新規登録成功時' do
#       visit new_user_registration_path
#       fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
#       fill_in 'user[email]', with: 'a' + user.email # 確実にuser, other_userと違う文字列にするため
#       fill_in 'user[password]', with: 'password'
#       fill_in 'user[password_confirmation]', with: 'password'
#       click_button 'Sign up'
#       is_expected.to have_content 'successfully'
#     end
#     it 'ユーザログイン成功時' do
#       visit new_user_session_path
#       fill_in 'user[name]', with: user.name
#       fill_in 'user[password]', with: user.password
#       click_button 'Log in'
#       is_expected.to have_content 'successfully'
#     end
#     it 'ユーザログアウト成功時' do
#       visit new_user_session_path
#       fill_in 'user[name]', with: user.name
#       fill_in 'user[password]', with: user.password
#       click_button 'Log in'
#       logout_link = find_all('a')[4].native.inner_text
#       logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#       click_link logout_link
#       is_expected.to have_content 'successfully'
#     end
#     it 'ユーザのプロフィール情報更新成功時' do
#       visit new_user_session_path
#       fill_in 'user[name]', with: user.name
#       fill_in 'user[password]', with: user.password
#       click_button 'Log in'
#       visit edit_user_path(user)
#       click_button 'Update User'
#       is_expected.to have_content 'successfully'
#     end
#     it '投稿データの更新成功時' do
#       visit new_user_session_path
#       fill_in 'user[name]', with: user.name
#       fill_in 'user[password]', with: user.password
#       click_button 'Log in'
#       visit edit_fashion_path(fashion)
#       click_button 'Update fashion'
#       is_expected.to have_content 'successfully'
#     end
#   end
# end
