class Cat < ActiveRecord::Base
  CAT_COLORS = %w(brown black white orange)
  before_validation :lower_case_color

  attr_accessible :age, :birth_date, :color, :name, :sex

  validates :name, :sex, :presence => true
  validates :color, :inclusion => { :in => CAT_COLORS }

  has_many :cat_rental_requests, dependent: :destroy

  def lower_case_color
   self.color = color.downcase if color
  end

end
