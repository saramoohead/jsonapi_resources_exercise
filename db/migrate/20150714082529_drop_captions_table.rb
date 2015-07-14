class DropCaptionsTable < ActiveRecord::Migration
  def up
    drop_table :captions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
