class Gallery < ActiveRecord::Base
  attr_accessible :avatar_url, :caption, :colour, :homage_url, :location, :theme, :timescale, :title, :user_id, :user_name
  has_many :votes, through: :voteable
  

  acts_as_voteable

  belongs_to :user
end
