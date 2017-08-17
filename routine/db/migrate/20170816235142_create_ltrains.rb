class CreateLtrains < ActiveRecord::Migration[5.1]
  def change
    create_table :ltrains do |t|
      t.string :rt
      t.string :destNm
      t.string :stpId
      t.string :staNm
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
