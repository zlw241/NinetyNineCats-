

class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ['APPROVED', 'PENDING', 'DENIED'] }
  validate :overlap



  belongs_to :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id

  def overlap
    rental_requests = CatRentalRequest.where("cat_rental_requests.id <> #{self.id}")
    rental_requests.each do |rr|

      # (self.cat_id != cat2.id) && !(self.end_date > cat2.start_date || self.start_date < cat2.end_date)

  end
end
