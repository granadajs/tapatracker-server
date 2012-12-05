require 'spec_helper'

describe Tapa do
  describe "add to category" do
    context "category exists" do
      it "appends itself to category" do
        category = create(:category)
        tapa = build(:tapa)
        tapa.category = category.name
        tapa.save; tapa.reload
        expect(tapa.categories.first.name).
          to eq(category.name)
      end
    end

    context "category doesn't exist" do

      it "creates category and appends to it" do
        tapa = build(:tapa)
        category_name = "Foo"
        expect {
          tapa.category = category_name
        }.to change(Category, :count).by(1)
        tapa.save; tapa.reload
        expect(tapa.categories.first.name).to eq(category_name)
      end
    end
  end
end
