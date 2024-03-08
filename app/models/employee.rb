class Employee < ApplicationRecord
	belongs_to :company, class_name: 'User', foreign_key: :company_id
	has_many :verifications
	
	validates :name, presence: { message: "Name can't be blank" }
  validates :email, presence: { message: "Email can't be blank" }

  validate :email_format

  private

  def email_format
    return if email.blank? || /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match?(email)

    errors.add(:email, "Email is invalid")
  end
end
