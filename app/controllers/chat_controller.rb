class ChatController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = User.all.where.not(id: current_user).without_role :admin
    @conversations = Conversation.includes(:recipient, :messages)             
  end

  def show
    @conversation = Conversation.find(params[:chat_id])
    @messages = @conversation.messages
  end

  def create
    @users = User.all.where.not(id: current_user).without_role :admin
  end
  
  def create_message  
    recipient_id = params[:message][:id]
    @conversation = Conversation.get(current_user.id, recipient_id.to_i)
    add_to_conversations unless conversated?
    @message = @conversation.messages.create!(message_params)    
    redirect_to action: "show",  :chat_id => @conversation.id
  end 
    
  private
  
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
 
  def conversated?
    session[:conversations].include?(@conversation.id)
  end
  
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
