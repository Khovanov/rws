class AddFullNamePassportToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :full_name, :string
    add_column :tickets, :passport, :string    
  end
end
