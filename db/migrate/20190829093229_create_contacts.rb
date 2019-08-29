class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :ruby
      t.integer :phone_number
      t.string :email
      t.integer :age
      t.string :blood
      t.string :gender
      t.integer :payment
      t.string :contact
      t.string :confirm_email1
      t.string :confirm_email2
    end
  end
end