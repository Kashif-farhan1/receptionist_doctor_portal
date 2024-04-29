class AddPasswordDigestToReceptionists < ActiveRecord::Migration[7.1]
  def change
    add_column :receptionists, :password_digest, :string
  end
end
