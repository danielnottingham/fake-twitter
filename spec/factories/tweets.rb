FactoryBot.define do
  factory :tweet do
    comment { "MyText" }
    association :user
  end
end
