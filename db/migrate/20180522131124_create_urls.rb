class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :link, null: false
      t.text :content

      t.timestamps
    end
  end
end
