class Reply < ActiveRecord::Base
	belongs_to :board
	validates :board_id, presence: true
	validates :r_content, presence: true
end
