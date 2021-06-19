import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    if (data.content.conservation_group_id == null) {
      const html = `
      <div class="mycomment">
        <p>${data.content.content}</p>
      </div>`;
      const chats = document.getElementById('chats');
      const newChat = document.getElementById('chat_content');
      chats.insertAdjacentHTML('beforeend', html);
      newChat.value='';
    } else {
      const html = `
      <div class="mycomment">
        <p>${data.content.content}</p>
      </div>`;
      const chats = document.getElementById('chats');
      const newChat = document.getElementById('chat_content');
      chats.insertAdjacentHTML('beforeend', html);
      newChat.value='';
    }
  }
});