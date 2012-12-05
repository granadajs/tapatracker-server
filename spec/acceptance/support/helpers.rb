module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def tapa_image
    File.expand_path("../../fixtures/tapa_image.jpg", __FILE__)
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
