class RenameUserIdToCompanyIdInEmployees < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :user_id, :company_id
  end
end
