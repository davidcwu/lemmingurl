class AddNonNullConstraintToUrls < ActiveRecord::Migration
  def change
    change_column :urls, :token, :string, :null => false
    change_column :urls, :target_url, :string, :null => false
  end
end
