class CreateVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :verifications do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer :company_id
      t.string :status

      t.timestamps
    end
  end
end
