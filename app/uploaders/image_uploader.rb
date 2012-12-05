# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  def cache_dir
    "#{Rails.root}/tmp/uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :icon40 do
    process :resize_to_fill => [40,40]
  end

  version :icon60 do
    process :resize_to_fill => [60,60]
  end

  version :icon100 do
    process :resize_to_fill => [100,100]
  end

  version :normal do
    process :resize_to_fill => [160,160]
  end

  process :resize_to_limit => [720,720]

  def extensions_white_list
    %w(jpg jpeg png gif)
  end

end
