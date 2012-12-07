# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    score { (1...5).to_a.sample }
  end
end
