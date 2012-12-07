require 'spec_helper'

describe User do

  describe "#add_tapa" do
    it "adds a tapa to the user" do
      tapa = create(:tapa)
      user = create(:user)
      user.add_tapa tapa
      expect(user.tapas.size).to eq(1)
    end
  end

  describe "#recent_images" do
    it "returns array of image urls" do
      user = create(:user)
      tapas_with_images = (1...3).map { |n|
        date = Time.local(2012, 4, n, 10, 00)
        create(:tapa, user: user, created_at: date )
      }
      tapas = (4...6).map { |n|
        date = Time.local(2012, 4, n, 10, 00)
        create(:tapa, user: user, image: nil, created_at: date )
      }
      (tapas + tapas_with_images).each do |tapa| user.add_tapa tapa end
      images = user.recent_images
      images.should == tapas_with_images.map { |tapa| tapa.image.url }.reverse
    end
  end

  describe "#recent_reviews" do
    it "returns array of recent tapas" do
      user = create(:user)
      tapas = (1...5).map { |n|
        date = Time.local(2012, 4, n, 10, 00)
        tapa = create(:tapa, user: user, created_at: date )
        user.add_tapa tapa
        tapa
      }
      user.recent_reviews(3).should ==
        Tapa.where(user_id: user.id).order("created_at DESC").limit(3).to_a
    end
  end
end
