# require 'rails_helper'

# describe '[STEP2] ユーザログイン後のテスト' do
#   let(:user) { create(:user) }
#   let!(:other_user) { create(:user) }
#   let!(:fashion) { create(:fashion, user: user) }
#   let!(:other_fashion) { create(:fashion, user: other_user) }

#   before do
#     visit new_user_session_path
#     fill_in 'user[name]', with: user.name
#     fill_in 'user[password]', with: user.password
#     click_button 'Log in'
#   end

#   describe 'ヘッダーのテスト: ログインしている場合' do
#     context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
#       subject { current_path }

#       it 'Usersを押すと、ユーザ一覧画面に遷移する' do
#         users_link = find_all('a')[2].native.inner_text
#         users_link = users_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#         click_link users_link
#         is_expected.to eq '/users'
#       end
#       it 'fashionsを押すと、投稿一覧画面に遷移する' do
#         fashions_link = find_all('a')[3].native.inner_text
#         fashions_link = fashions_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#         click_link fashions_link
#         is_expected.to eq '/fashions'
#       end
#     end
#   end

#   describe '投稿一覧画面のテスト' do
#     before do
#       visit fashions_path
#     end

#     context '投稿成功のテスト' do
#       before do
#         fill_in 'fashion[title]', with: Faker::Lorem.characters(number: 5)
#         fill_in 'fashion[body]', with: Faker::Lorem.characters(number: 20)
#       end

#       it '自分の新しい投稿が正しく保存される' do
#         expect { click_button 'Create fashion' }.to change(user.fashions, :count).by(1)
#       end
#       it 'リダイレクト先が、保存できた投稿の詳細画面になっている' do
#         click_button 'Create'
#         expect(current_path).to eq '/fashions/' + fashion.last.id.to_s
#       end
#     end
#   end

#   describe '自分の投稿詳細画面のテスト' do
#     before do
#       visit fashion_path(fashion)
#     end

#     context '投稿成功のテスト' do
#       before do
#         fill_in 'fashion[title]', with: Faker::Lorem.characters(number: 5)
#         fill_in 'fashion[body]', with: Faker::Lorem.characters(number: 20)
#       end

#       it '自分の新しい投稿が正しく保存される' do
#         expect { click_button 'Create fashion' }.to change(user.fashions, :count).by(1)
#       end
#     end
#   end

#   describe '自分の投稿編集画面のテスト' do
#     before do
#       visit edit_fashion_path(fashion)
#     end
#   end

#   describe '自分のユーザ詳細画面のテスト' do
#     before do
#       visit user_path(user)
#     end

#     context '表示の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/users/' + user.id.to_s
#       end
#       it '投稿一覧のユーザ画像のリンク先が正しい' do
#         expect(page).to have_link '', href: user_path(user)
#       end
#     end

#     context '更新成功のテスト' do
#       before do
#         @user_old_name = user.name
#         @user_old_intrpduction = user.introduction
#         fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
#         fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
#         click_button 'Update User'
#       end

#       it 'nameが正しく更新される' do
#         expect(user.reload.name).not_to eq @user_old_name
#       end
#       it 'introductionが正しく更新される' do
#         expect(user.reload.introduction).not_to eq @user_old_intrpduction
#       end
#     end
#   end
# end