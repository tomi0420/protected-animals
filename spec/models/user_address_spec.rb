require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  before do
    @user_address = FactoryBot.build(:user_address)
  end

  describe '住所情報の登録' do
    context '登録ができる場合' do
      it 'postal_codeとprefecture_idとcityとaddressとphone_numberがあれば、登録できる' do
        expect(@user_address).to be_valid
      end
      it 'postal_codeが、半角数字だと登録できる' do
        @user_address.postal_code = '123-4567'
        expect(@user_address).to be_valid
      end
      it 'postal_codeに、ハイフン(-)があれば登録できる' do
        @user_address.postal_code = '123-4567'
        expect(@user_address).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @user_address.building = ''
        expect(@user_address).to be_valid
      end
      it 'phone_numberが、半角数字だと登録できる' do
        @user_address.phone_number = '99012345678'
        expect(@user_address).to be_valid
      end
      it 'phone_numberに、ハイフン(-)がなければ登録できる' do
        @user_address.phone_number = '99012345678'
        expect(@user_address).to be_valid
      end
    end

    context '登録できない場合' do
      it 'postal_codeがないと登録できない' do
        @user_address.postal_code = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角だと登録できない' do
        @user_address.postal_code = '１２３－４５６７'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeにハイフン(-)がないと登録できない' do
        @user_address.postal_code = '1_234_567'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idがないと登録できない' do
        @user_address.prefecture_id = 1
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityがないと登録できない' do
        @user_address.city = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがないと登録できない' do
        @user_address.address = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがないと登録できない' do
        @user_address.phone_number = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角だと登録できない' do
        @user_address.phone_number = '０９０１２３４５６７８'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberにハイフン(-)があると登録できない' do
        @user_address.phone_number = '123-4567-8910'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが英数字混合だと登録できない' do
        @user_address.phone_number = 'abcde123456'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @user_address.phone_number = '1_234_567_891_011'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
