class User < ApplicationRecord    
  ROLES = %w[admin company].freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, inclusion: { in: ROLES }
  has_many :employees, foreign_key: :company_id, dependent: :destroy  
  has_many :verifications, foreign_key: :company_id
  
  def admin?
    role == 'admin'
  end

  def company?
    role == 'company'
  end

end
