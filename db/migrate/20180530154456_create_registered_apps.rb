class CreateRegisteredApps < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|
      t.string :name
      t.string :url
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
