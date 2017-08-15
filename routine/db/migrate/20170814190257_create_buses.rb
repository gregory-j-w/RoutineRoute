class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :rt
      t.string :rtnm
      t.string :rtdir
      t.string :stpid
      t.string :stpnm
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
