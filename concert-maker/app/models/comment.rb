class Comment < ActiveRecord::Base
	belongs_to :concert
	validates :name, :text, presence: true

end
