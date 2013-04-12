class AddFieldsToUrls < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.column :shortened_url, :string
      t.column :target_url, :string

      t.index :shortened_url, :unique => true
    end
  end
end
