class CreateInquiry < ActiveRecord::Migration[5.2]
  def change
    create_table :inquirys do |t|
      t.string :name
      t.string :ruby
      t.string :email
      t.string :contact
    end
  end
end
