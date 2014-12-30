class AddInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :referer, :string
    add_column :events, :page, :string
    add_column :events, :client_ip, :string
    add_column :events, :server_software, :string
    add_column :events, :date, :string
    add_column :events, :client_email, :string
    add_column :events, :client_browser, :string
    add_column :events, :hostname, :string
    add_column :events, :username, :string
  end
end
