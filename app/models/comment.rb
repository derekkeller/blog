class Comment < ActiveRecord::Base

  validates :name, :email, :body, :presence => true
  validate :article_should_be_published

  belongs_to :article
  
  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  article_id :integer
#  name       :string(255)
#  email      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

