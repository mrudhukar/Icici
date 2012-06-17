class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.belongs_to :user
      t.belongs_to :policy
      t.string :reference_number
      t.date :loss_date
      t.string :cause
      t.integer :gross_amount
      t.string :status


      t.timestamps
    end
  end
end
