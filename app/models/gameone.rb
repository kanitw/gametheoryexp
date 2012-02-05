class Gameone < ActiveRecord::Base
  after_initialize :default_values
  
  attr_accessible :user1, :user2, :state

	private
    def default_values
      self.state ||= -1
    end                     
end
