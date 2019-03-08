class CreateWhiteboards < ActiveRecord::Migration[5.1]
  def change
    create_table :whiteboards do |t|
      t.string :title
      t.text :description
      t.binary :image
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
