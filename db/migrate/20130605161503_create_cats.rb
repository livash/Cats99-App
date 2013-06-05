class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, :null => false
      t.integer :age
      t.string :color
      t.date  :birth_date
      t.string  :sex

      t.timestamps
    end

    create_table :cat_rental_requests do |t|
      t.integer :cat_id
      t.date  :begin_date
      t.date :end_date
      t.string :status, :default => "undecided"
    end
  end
end

