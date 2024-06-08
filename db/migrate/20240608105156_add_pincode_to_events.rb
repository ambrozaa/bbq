class AddPincodeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :pincode, :string
  end
end
