class ChangeTokenToSecretToken < ActiveRecord::Migration
  def change
    rename_column :urls, :token, :secret_token
  end
end
