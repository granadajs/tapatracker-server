module DashboardHelper
  def profile_image
    if url = current_user.profile_image.url
      image_tag url
    else
      image_tag image_path('default_profile_360x360.gif')
    end
  end

  def recent_images
    images = current_user.recent_images
    images.map { |image| content_tag :li, image_tag(image), class: "recent-image" }.
      join("\n").html_safe
  end

  def recent_reviews
    current_user.recent_reviews
  end
end
