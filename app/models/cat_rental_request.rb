

class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ['APPROVED', 'PENDING', 'DENIED'] }
  validate :request_validator

  def overlapping_requests
    CatRentalRequest.where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where.not("start_date > ? OR end_date < ?", self.end_date, self.start_date)
  end

  def approved_overlapping_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def request_validator
    unless approved_overlapping_requests.empty?
      errors[:overlapping_request] << "Request overlaps with another"
    end
  end

  def approve!
    update(status: "APPROVED")
    save
    overlapping_pending_requests.each do |opr|
      opr.deny!
    end
  end

  def deny!
    update(status: "DENIED")
    save
  end

  def pending?
    self.status == 'PENDING' ? true : false
  end 

  belongs_to :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id

end
