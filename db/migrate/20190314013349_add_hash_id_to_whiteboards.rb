class AddHashIdToWhiteboards < ActiveRecord::Migration[5.1]
  
  def up
    add_column :whiteboards, :hash_id, :string, index: true
    Whiteboard.all.each { |m| m.set_hash_id; m.save}
  end

  def down
    remove_column :whiteboards, :hash_id, :string
  end

end
