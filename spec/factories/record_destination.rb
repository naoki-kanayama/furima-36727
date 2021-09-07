FactoryBot.define do
  factory :record_destination do
    prefecture_id { 24 }
    city { '名古屋市中区' }
    address { '栄' }
    building_number { 'サンプルマンション' }
    tel_number { '09012345678' }
    address_number { '000-0000' }
  end
end
