class AddTokenToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :token, :string
  end
end
