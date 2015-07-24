require 'obscenity/active_model'
require 'obscenity/rack'

class Board < ActiveRecord::Base
	validates :b_content, obscenity: { sanitize: true, replacement: :stars }
	after_initialize :init

	def init
		self.b_click_count ||= 0
		self.b_like ||= 0
	end
end
