class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    # redirect_to conversation_path(receipt.conversation)
    receipt.save
      respond_to do |format|
        format.js { render partial: 'messages/update_message_card', locals: { receipt: receipt, conversation: receipt.conversation,
            message: render_to_string(partial: 'conversations/conversations_modal', locals: {receipt: receipt, conversation: receipt.conversation}) } }
      end
  end

  def destroy
    receipt = @conversation.receipts.find(params[:id])
    receipt.destroy
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
