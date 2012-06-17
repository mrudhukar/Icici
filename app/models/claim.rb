class Claim < ActiveRecord::Base
  module Status
    INTIMATION_RECEIVED = "Claim intimation received"
    SURVEY_APPOINTED = "Surveyor appointed"
    PENDING_FOR_CLAIM_DOCUMENTS = "Pending for claim documents"
    SENT_FOR_PAYMENT = "Sent for payment"
    PENDING_FOR_ASSESMENT_CONFIRMATION = "Pending for assessment confirmation"
    PAID_AND_CLOSED = "Paid and closed"

    def self.all
      [INTIMATION_RECEIVED, SURVEY_APPOINTED, PENDING_FOR_CLAIM_DOCUMENTS, SENT_FOR_PAYMENT, PENDING_FOR_ASSESMENT_CONFIRMATION, PAID_AND_CLOSED]
    end
  end
  belongs_to :policy
  belongs_to :user  

  validates :policy, :reference_number, :loss_date, :cause, :status, :presence => true
  validates :status, :inclusion => {:in => Status.all}

  scope :paid, where(:status => Status::PAID_AND_CLOSED)
  scope :not_paid, where("status != ?",Status::PAID_AND_CLOSED)

  def product_type
    self.policy.product_type
  end

  def number
    self.policy.number
  end
end
