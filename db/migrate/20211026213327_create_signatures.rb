class CreateSignatures < ActiveRecord::Migration[6.1]
  def change
    create_table :signatures do |t|
      t.string :username,         null: false
      t.string :api_key,          null: false
      t.string :static_signature, null: false
      t.string :background_color, null: false, default: '#ffffff'

      t.timestamps
    end

    add_index :signatures, :username, unique: true
    add_index :signatures, :api_key,  unique: true
  end
end
