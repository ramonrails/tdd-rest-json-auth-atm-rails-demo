class CreateTellers < ActiveRecord::Migration[6.0]
  def change
    create_table :tellers do |t|
      t.integer :denomination
      t.integer :notes

      t.timestamps
    end
  end
end
