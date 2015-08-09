class CreateMyRailsBoardRows < ActiveRecord::Migration
  def change
    create_table :my_rails_board_rows do |t|
      
    t.string :subject
    t.string :name
    t.string :univ_name
    t.string :univ_team
    t.integer :hits
    

      t.timestamps null: false
    end
  end
end
