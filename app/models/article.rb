class Article < ApplicationRecord
	belongs_to :user

	validates_presence_of :user, :title, :content, :category
	validates :category, inclusion: { in: ['Art', 'Business', 'Finance', 'Health', 'Politics'],
    message: "%{value} is not a category" }
    validates :title, length: { minimum: 2 }
  	validates :content, length: { maximum: 500 }

    def self.categories
    	['Art', 'Business', 'Finance', 'Health', 'Politics']
    end

    def is_author?(current_user)
    	self.user == current_user
    end

    def self.recent_articles
    	group(:category).limit(3)
    end
end