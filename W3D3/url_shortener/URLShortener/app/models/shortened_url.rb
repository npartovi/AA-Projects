require 'securerandom'

class ShortenedUrl < ApplicationRecord

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  has_many :visitors,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit


  def self.random

    generated = SecureRandom.urlsafe_base64(16)

    while self.exists?(short_url: generated)
      generated = SecureRandom.urlsafe_base64(16)
    end

    generated
  end

  def self.create_short_url(user, long_url)
    shortened_url = ShortenedUrl.random
    ShortenedUrl.create!(short_url: shortened_url, long_url: long_url, user_id: user.id)
  end


  def num_clicks
    (<<-SQL)
      SELECT
        COUNT(visitors)
      FROM
        visits
    SQL

  end

  def num_uniques
  end

  def num_recent_uniques
  end


end
