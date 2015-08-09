class CreateQuestionPosts < ActiveRecord::Migration
  def change
    create_table :question_posts do |t|
      
      t.string :qp_title        #질문 글 제목
      t.integer :qp_password    #질문 글 도어락
      t.text   :qp_content      #질문 글 본문

      t.timestamps null: false
    end
  end
end
