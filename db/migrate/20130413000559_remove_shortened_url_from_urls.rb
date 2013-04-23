class RemoveShortenedUrlFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :shortened_url
  end
end
