class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    # redirect_to conversation_path(receipt.conversation)
    receipt.save
    if params[:page] == "show"
      redirect_to conversation_path(receipt.conversation)
    else
      respond_to do |format|
        format.js { render partial: 'messages/update_message_card', locals: { receipt: receipt, conversation: receipt.conversation, anchor: "message-#{(receipt.id - 1)}",
            message: render_to_string(partial: 'conversations/conversations_modal', locals: {receipt: receipt, conversation: receipt.conversation}) } }
      end
    end
  end

  def destroy
    receipt = @conversation.receipts.find(params[:id])
    recipient = @conversation.participants.find { |p| p != current_user }
    receiver = recipient.mailbox.conversations.find(@conversation.id).receipts.find(params[:id].to_i - 1)
    receipt.destroy && receiver.destroy
    respond_to do |format|
        format.js { render partial: 'update_message_card',
          locals: { message: render_to_string(partial: 'conversations/conversations_modal', locals: {conversation: @conversation}) } }
      end
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
