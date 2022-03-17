FactoryBot.define do
  factory :product_purchase do
    postal_code{"000-0001"}
    ship_from_id{2}
    city{"大阪府"}
    house_number{"あ1-1-1"}
    building_name{"シャルマン"}
    telephone_number{"09012345678"}
    token{"test"}
  end
end
