class CreateTestModels < ActiveRecord::Migration[5.0]
  def change
    create_table :test_models do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
