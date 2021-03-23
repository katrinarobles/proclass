import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.querySelectorAll('.messages');
  messagesContainers.forEach( messagesContainer => {
    if (messagesContainer) {
      const id = messagesContainer.dataset.conversationId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          console.log(data)
          messagesContainer.innerHTML = data;
        },
      });
    }
  });
}

export { initChatroomCable };
