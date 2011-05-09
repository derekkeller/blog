class Article < ActiveRecord::Base

  validates :title, :presence => true
  validates :body,  :presence => true

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  scope :published, where("articles.published_at IS NOT NULL")
  scope :draft, where("articles.published_at IS NULL")
  scope :recent, lambda{ Article.where("published_at > ?", 1.week.ago.to_date)}
  scope :where_title, lambda{ |term| Article.where("title LIKE ?", "%#{term}%")}

  def long_title
    "#{title} - #{published_at}"
  end

  def published?
    published_at.present?
  end
  
end

# == Schema Information
#
# Table name: articles
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  excerpt      :string(255)
#  location     :string(255)
#  user_id      :integer
#

