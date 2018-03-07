# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

  COLORS = ['red','orange', 'yellow','green', 'blue', 'purple']
  SEX = ["M", "F"]

  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEX
  validates :description, :birth_date, :name, :color, :sex, presence: true

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

          

end
