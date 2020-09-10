FactoryBot.define do
  factory :buyer_form do
    post_code         {"987-6543"}
    zone_id           {15}    
    city              {"横浜市"}
    adress            {"青山1-2"}
    building          {"柳ビル1-1"}
    phone_number     {"08012345678"}
    token            {"tok_hogehogehoge"}
  end
end
