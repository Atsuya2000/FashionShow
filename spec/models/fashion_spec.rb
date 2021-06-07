require 'rails_helper'

RSpec.describe 'Fashionモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { fashion.valid? }

    let(:user) { create(:user) }
    let!(:fashion) { build(:fashion, user_id: user.id) }

    context 'introductionカラム' do
      it '空欄でないこと' do
        fashion.introduction = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Fashion.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
