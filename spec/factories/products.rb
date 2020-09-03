FactoryBot.define do
  factory :product do
    name {'テスト'}
    description {'テキストテキストテキスト'}
    category_id {1}
    status_id {1}
    cost_id {2}
    zone_id {2}
    days_id {2}
    price {2000}
    association :user
  end
end
