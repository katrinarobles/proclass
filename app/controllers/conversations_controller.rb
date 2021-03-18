class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
    console
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])

  end

  def new
    @course = Course.find(params[:course_id])
    @to_recipient = User.find(@course.user.id) # User.all - [current_user]
  end

  def create
    course = Course.find(params[:course_id])
    recipient = User.find(course.user.id)
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversations_path(receipt.conversation)
  end

  def destroy
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.destroy
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end
end
