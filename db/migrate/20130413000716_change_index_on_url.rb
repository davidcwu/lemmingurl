class ChangeIndexOnUrl < ActiveRecord::Migration
  def change
    add_index :urls, :token, :unique => true
  end
end
