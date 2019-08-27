class CreateInquiry < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :ruby
      t.string :email
      t.string :confirm_email1
      t.string :confirm_email2
      t.string :contact
    end
  end
end
