class Verification < ApplicationRecord
  belongs_to :employee
  belongs_to :company, class_name: 'User', foreign_key: 'company_id'
  
  enum status: [:pending, :approved, :rejected]

end
