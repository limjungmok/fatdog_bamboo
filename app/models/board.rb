require 'obscenity/active_model'
require 'obscenity/rack'

class Board < ActiveRecord::Base
	has_many :replies
	validates :b_content, obscenity: { sanitize: true, replacement: :stars }
	after_initialize :init

	def init
		self.b_click_count ||= 0
		self.b_like ||= 0
	end
end
