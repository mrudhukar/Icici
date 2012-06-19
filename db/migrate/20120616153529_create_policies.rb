class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.belongs_to :user
      t.string :product_type
      t.string :number
      t.string :insurer, :default => "ICICI Lombard"
      t.integer :premium
      t.date :start
      t.date :end_date
      t.boolean :intimation_required, :default => true

      t.timestamps
    end
  end
end
