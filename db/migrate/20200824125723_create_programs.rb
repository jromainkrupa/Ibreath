class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.date :start_time
      t.references :user, null: false, foreign_key: true
      t.integer :init_smoke

      t.timestamps
    end
  end
end
