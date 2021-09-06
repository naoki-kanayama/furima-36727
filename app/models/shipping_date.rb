class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, date: '--' },
    { id: 2, date: '１〜２日で発送' },
    { id: 3, date: '２〜３日で発送' },
    { id: 4, date: '４〜７日で発送' }
  ]

    include ActiveHash::Associations
    has_many :items
end