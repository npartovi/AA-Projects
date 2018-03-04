class Visit < ApplicationRecord
  validates :shortened_url_id, presence: true, uniqueness: true
  validates :visitor_id, presence: true, uniqueness: true

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

  belongs_to :user,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User
end
