class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :followed, index: true, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
