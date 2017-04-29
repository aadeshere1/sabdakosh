class CreateAcronyms < ActiveRecord::Migration[5.0]
  def change
    create_table :acronyms do |t|
      t.string :acry
      t.string :full_form
      t.text :definition
      t.timestamps
    end
  end
end
