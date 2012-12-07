# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tapa do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences(2).join(' ') }
    image { File.open(File.expand_path("../../acceptance/fixtures/tapa_image.jpg", __FILE__)) }
    after_create do |tapa|
      tapa.rating = FactoryGirl.create(:rating)
      tapa.save
    end
  end
end
