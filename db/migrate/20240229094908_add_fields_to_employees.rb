class AddFieldsToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :field_of_study, :string
    add_column :employees, :university, :string
    add_column :employees, :graduation_year, :integer
    add_column :employees, :gpa, :float
    add_column :employees, :additional_degrees, :string
    add_column :employees, :birthdate, :string
    add_column :employees, :address, :string
    add_column :employees, :gender, :string
    add_column :employees, :marital_status, :string
    add_column :employees, :nationality, :string
    add_column :employees, :emergency_contact, :string
    add_column :employees, :emergency_contact_relationship, :string
  end
end
