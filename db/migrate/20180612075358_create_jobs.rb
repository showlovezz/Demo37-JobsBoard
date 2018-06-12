class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url
      t.string :address
      t.string :people
      t.string :work_location
      t.string :image

      t.timestamps
    end
  end
end
