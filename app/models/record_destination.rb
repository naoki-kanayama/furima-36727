class RecordDestination
  include ActiveModel::Model
  attr_accessor :city, :address, :building_number, :address_number, :tel_number, :record_id, :user_id, :item_id, :prefecture_id, :token
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :address_number, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-). Enter half-width" }
    validates :tel_number, format: {with: /\A\d{10,11}\z/, message: "is invalid Not include hyphen(-). Enter half-width" }
    validates :user_id
    validates :item_id
    validates :token
  end
    
    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Destination.create(city: city, prefecture_id: prefecture_id, address: address,building_number: building_number, address_number: address_number,tel_number: tel_number, record_id: record.id)
    end
end

