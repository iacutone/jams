class CreateApiAuths < ActiveRecord::Migration
  def change
    create_table :api_auths do |t|
      t.string :token

      t.timestamps
    end
  end
end
