require "juggernaut"

class GameController < ApplicationController
  
  WAIT = -1
  CONNECTED = 0
  PROPOSED = 1
  RESPONDED = 2

	def gamestart
	  @message = {:state => 0}
	  @sender = params[:sender]
 	  Juggernaut.publish(select_channel("/channel1_channel2"), 
 	                   parse_chat_message(@message, @sender, 1))	
	  respond_to do |format|
	    format.js
  	end
	end

	def parse_chat_message(msg, sender, receiver)
	  j = ActiveSupport::JSON
	  message = {:sender=> sender, :receiver=> receiver, :msg => msg}
	  return j.encode(message)
	end

	def select_channel(receiver)
	  puts "#{receiver}"
	  return "/game#{receiver}"
	end
	
	def create
	  @game = Gameone.find_by_state(WAIT);
	  if @game
	    @game.user2 = 2
	    @game.state = CONNECTED
	    @game.save
	    render :template => "/game/create", :locals => {:uid => 2, :gameid => @game.id}
	  else
	    game = Gameone.new :user1 => 1, :state => WAIT
      game.save
      render :template => "/game/create", :locals => {:uid => 1, :gameid => game.id}
	  end
	end
	
	def propose
	  @sender = params[:sender]
	  @gameid = params[:gameid]
	  @game = Gameone.find_by_id(@gameid)
	  @game.offer = params[:offer]
	  @game.save
	  @message = {:state => 1, :offer => params[:offer]}
 	  Juggernaut.publish(select_channel("/channel1_channel2"), 
 	                   parse_chat_message(@message,@sender,2))	
	  respond_to do |format|
	    format.js
  	end
  end  
  
  def respond
     @sender = params[:sender]
     @gameid = params[:gameid]
  	 @message = {:state => 2, :decision => params[:decision]}
  	 @game = Gameone.find_by_id(@gameid)
   	  Juggernaut.publish(select_channel("/channel1_channel2"), 
   	                   parse_chat_message(@message,@sender,1))	
  	  respond_to do |format|
  	    format.js
    	end
  end
	
end
