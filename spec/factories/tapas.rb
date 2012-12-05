# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tapa do
    title "Tortilla"
    description "Muy bueno. Muy muy."
    image { File.open(File.expand_path("../../acceptance/fixtures/tapa_image.jpg", __FILE__)) }
  end
end
