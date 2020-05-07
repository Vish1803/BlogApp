class Post < ApplicationRecord
  include WordParse

  has_many :tags
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates_inclusion_of :state, :in => [ 'Draft', 'Published', 'Archive' ], :message => "%{value} is not a valid state"
  validates_presence_of :title, :body
  validates_length_of :title, maximum: 50
  validates_length_of :body, maximum: 200

  scope :drafts, -> { where(:state => 'Draft') }
  scope :published, -> { where(:state => 'Published') }

  validate :validate_post

  def validate_post
    if self.state.eql?('Draft') && Post.drafts.where(user_id: self.user_id).count > 1
      errors.add("More than one posts can not be saved as draft")
    end
  end

end
