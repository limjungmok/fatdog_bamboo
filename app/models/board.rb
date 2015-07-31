require 'obscenity/active_model'
require 'obscenity/rack'

class Board < ActiveRecord::Base
	has_many :replies
	accepts_nested_attributes_for :replies
	validates :b_category, presence: true, length: { maximum: 20 }
	validates :b_content, obscenity: { sanitize: true, replacement: :stars }
	after_initialize :init

	def init
		self.b_click_count ||= 0
		self.b_like ||= 0
	end

	def self.search(search)
		if search
			where('b_category LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end
