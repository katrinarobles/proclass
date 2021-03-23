class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    conversation = Mailboxer::Conversation.find(params[:id])
    stream_for conversation

    # stream_from "chat_#{params[:chatroom_id]}"
    # stream_from "conversations-nav#{params[:id]} %>"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
