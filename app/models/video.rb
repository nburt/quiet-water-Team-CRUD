class Video < ActiveRecord::Base
  validates_presence_of :url, message: "URL cannot be blank"
  validates_presence_of :description, message: "Description cannot be blank"
  validates_length_of :description, maximum: 255, message: "Description cannot be longer than 255 characters"

  validates :url,
            format: {
              with: /watch\?v=.{11}\Z/,
              message: "URL must be valid"
            }
end