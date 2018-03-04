class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :short_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visited_urls,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit
end
