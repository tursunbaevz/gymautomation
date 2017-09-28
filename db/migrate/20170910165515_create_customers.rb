class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.decimal :number
      t.decimal :second_number
      t.date :published_on
      t.date :date_of_birth

      t.timestamps
    end

  

    create_table :gyms do |t|
      t.string :title
      t.decimal :price
      
      t.timestamps
    end

    create_table :payments do |t|
      t.decimal :price
      t.date :payment_date
      t.integer :customer_id
      t.integer :gym_id

      t.timestamps
    end
    

    create_table :form_of_payments do |t|
      t.string :title

      t.timestamps
    end

  end
end
