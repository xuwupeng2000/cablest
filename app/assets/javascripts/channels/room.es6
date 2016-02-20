App.room = App.cable.subscriptions.create("RoomChannel",
  function connected() {
    console.log('connected');
  },

  function disconnected() {
    console.log('disconnected');
  },

  function received(data) {
    console.log('data received:', data);
  },

  function host(name) {
    this.perform('host');
  }

  function quit(room_id) {
    this.perform('quit', room_id);
  },

  function join(room_id) {
    this.perform('join', room_id);
  },

  function speak(message) {
    this.perform('speak', message);
  }

);
