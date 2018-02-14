class AddUserToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, foreign_key: true
    Comment.all.each do |comment| 
    	user = User.find_by(email: comment.user_name)
    	user ||= User.first
    	comment.user = user
    	comment.save
    end 
    remove_column :comments, :user_name, :string
  end
end
