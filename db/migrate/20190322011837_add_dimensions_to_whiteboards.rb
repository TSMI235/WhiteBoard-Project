class AddDimensionsToWhiteboards < ActiveRecord::Migration[5.1]
  def change
    add_column :whiteboards, :canvas_height, :integer
    add_column :whiteboards, :canvas_width, :integer
  end
end
