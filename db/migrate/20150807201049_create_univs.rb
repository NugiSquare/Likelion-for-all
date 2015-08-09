class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|
      
      t.string :univ_name             #학교이름
      t.integer :univ_code            #학교 코드 => 코드표 띄워둘것
      t.string :univ_logo             #학교로고
      t.string :univ_leader_name      #1.학교대표이름
      t.string :univ_leader_picture   #.학교대표사진
      t.integer :univ_howmany_team    #2.팀 갯수
      t.integer :univ_howmany_people  #3.전체 정원
      t.string :univ_where            #4.소재지역 도 / 시(구, 군) / 동(면)
      t.text :univ_introduce          #5.학교3기 소개
      t.string :univ_our_picture1     #6.학교3기 활동사진1
      t.string :univ_our_picture2     #7.학교3기 활동사진2
      t.string :univ_our_picture3     #8.학교3기 활동사진3

      t.timestamps null: false
    end
  end
end
