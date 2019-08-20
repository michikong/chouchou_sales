class CreateInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :info do |t|
      t.string :name
      t.string :ruby
      t.integer :phone_number
      t.string :email
      t.integer :age
      t.string :gender
      t.integer :payment
      t.string :contact
    end
  end
end
