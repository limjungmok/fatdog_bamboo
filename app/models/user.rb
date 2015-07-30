class User < ActiveRecord::Base    
  validates :u_id, presence: true
  validates :u_pwd, presence: true

end
