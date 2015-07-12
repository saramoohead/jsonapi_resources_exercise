class AddImageIdToCaptions < ActiveRecord::Migration
  def change
    add_reference :captions, :image, index: true, foreign_key: true
  end
end
