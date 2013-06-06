class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date, :status
  before_validation :lower_case_status

  validates :begin_date, :end_date, :presence => true
  #validates :cat_id, :numericality => true
  validates :status, :inclusion => { :in => %w(approved denied undecided) }
  # validate :date_overlap_validation

  belongs_to :cat

  def date_overlap_validation
    current_cat_id = cat_id

    all_requests_for_id = CatRentalRequest.find_by_cat_id(params[:cat_id])

    all_requests_for_id.each do |request|
      if self.begin_date.between?(request.begin_date, request.end_date)
        return false
      elsif self.end_date.between?(request.begin_date, request.end_date)
        return false
      elsif self.begin_date < request.begin_date && self.end_date >request.end_date
        return false
      elsif self.begin_date < Time.now
        return false
      else
        true
      end
    end
  end

  def lower_case_status
   self.status = status.downcase if status
  end

  def approve
    self.status = 'approved'
    self.save!
  end

  def deny
    self.status = 'denied'
    self.save!
  end
end
