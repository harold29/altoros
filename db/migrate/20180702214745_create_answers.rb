class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :answerable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
