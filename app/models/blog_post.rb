class BlogPost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(posted_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(posted_at: nill) }
  scope :posted, -> { where("posted_at <= ?", Time.current) }
  scope :scheduled, -> { where("posted_at >= ?", Time.current) }

  def draft?
    posted_at.nil?
  end

  def posted?
    posted_at? && posted_at <= Time.current
  end

  def scheduled?
    posted_at? && posted_at > Time.current
  end
end
