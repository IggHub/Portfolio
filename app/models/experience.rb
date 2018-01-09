class Experience < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react
    where(subtitle: "React")
  end

  scope :ruby_on_rails_experience_items, -> {where(subtitle: "Ruby On Rails")}
end
