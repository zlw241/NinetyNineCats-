

class Cat < ActiveRecord::Base

  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }

  has_many :cat_rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id,
    dependent: :destroy

end
