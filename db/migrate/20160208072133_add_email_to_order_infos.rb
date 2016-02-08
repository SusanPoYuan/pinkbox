class AddEmailToOrderInfos < ActiveRecord::Migration
  def change
  	add_column :order_infos, :email, :string
  end
end
