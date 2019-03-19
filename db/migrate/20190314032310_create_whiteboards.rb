class CreateWhiteboards < ActiveRecord::Migration[5.1]
  def change
    create_table :whiteboards do |t|
      t.string :title
      t.text :description
      t.string :creator_email
      t.string :hash_id

      t.timestamps
    end
  end
end
