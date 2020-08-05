class CreateDomainEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :domain_events do |t|
      t.string :unique_id
      t.string :name
      t.datetime :started_at
      t.datetime :finished_at
      t.json :data

      t.timestamps
    end
  end
end
