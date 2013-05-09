class RenameTargetUrlToUrl < ActiveRecord::Migration
  def change
    rename_column :urls, :target_url, :url
  end
end
