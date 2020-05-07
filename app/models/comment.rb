class Comment < ApplicationRecord
  include WordParse

  belongs_to :post
  belongs_to :user

  validates_length_of :description, maximum: 100
  has_many :comments, :class_name => 'Comment', :foreign_key => 'comment_id', :dependent => :destroy
end
