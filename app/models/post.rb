class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable

  validates :title,
    presence: true,
    length: {minimum: 2, maximum: 100}

  validates :link,
  presence: true,
  format: { with: URI::regexp(%w(http https))}

end
