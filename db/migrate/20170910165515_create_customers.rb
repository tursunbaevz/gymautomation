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


    create_table :categories do |t|
      t.string :name

      t.timestamps
    end


    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :description
      t.decimal :p_quantity
      t.integer :category_id
      
      t.timestamps
    end


    create_table :solds do |t|
      t.decimal :sold_quantity
      t.date :sold_date
      t.integer :product_id 


      t.timestamps
    end


    # create_table :sold_products do |t|
    #   t.integer :sold_id  
    #   t.integer :product_id  
      
    #   t.timestamps
    # end

  end
end
