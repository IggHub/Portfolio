class Experience < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react
    where(subtitle: "React")
  end

  scope :ruby_on_rails_experience_items, -> {where(subtitle: "Ruby On Rails")}
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400" #setting default for main_image
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end
