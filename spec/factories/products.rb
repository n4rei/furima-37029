FactoryBot.define do
  factory :product do
    price              {500}
    name_products      {"宝物"}
    explanation        {"友人にもらったもの"}
    category_id        {2}
    condition_id       {2}
    delivery_id        {2}
    ship_day_id        {2}
    ship_from_id       {2}

    after(:build) do |product|
      product.image.attach(io: File.open('public/test_mugiwara.png'), filename: 'test_mugiwara.png')
    end
  end
end
