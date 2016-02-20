App.room = App.cable.subscriptions.create("RoomChannel",
  {
    connected: function connected() {
      console.log('connected');
    },

    disconnected: function disconnected() {
      console.log('disconnected');
    },

    received: function received(data) {
      console.log('data received:', data);
    },

    quit: function quit(room_id) {
      this.perform('quit', room_id);
    },

    join: function join(room_id) {
      this.perform('join', room_id);
    },

    speak: function speak(message) {
      this.perform('speak', {message: message});
    }
  }
);
