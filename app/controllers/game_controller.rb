require "juggernaut"

class GameController < ApplicationController
	def send_message
	@messg = params[:msg_body]
	@sender = params[:sender]
 	Juggernaut.publish(select_channel("/channel1_channel2"), parse_chat_message(params[:msg_body], params[:sender]))	
	respond_to do |format|
	    format.js
  	end
	end

	def parse_chat_message(msg, user)
	return "#{user}: #{msg}"
	end

	def select_channel(receiver)
	puts "#{receiver}"
	return "/game#{receiver}"
	end
	
	def create
	  @game = Gameone.find_by_status(WAIT);
	  if @game
	    @game.user2 = 2
	    @game.state = CONNECT
	    @game.save
	    respond_to do |format|
        format.js
      end
	  else
	    game = Gameone.new :user1 => 1, :state => WAIT
      game.save
      repond_to do |format|
        format.js
      end
	  end
	end
	
	def propose
	  
  end
  
  
  def respond
    
  end
	
end
