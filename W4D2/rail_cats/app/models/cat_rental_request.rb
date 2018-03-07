# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#

class CatRentalRequest < ApplicationRecord

  STATUS = ['PENDING', 'APPROVED', 'DENIED']

  validates :status, inclusion: STATUS
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    # CatRentalRequest.where(cat_id: cat_id)
    #
    #   .where('end_date >= ?', self.start_date)
    #   .where('start_date <= ?',self.end_date)
  end

  def overlapping_approved_requests

  end

end
