(() => {
  'use strict';

  angular
    .module('croom')
    .factory('roomChannel', factory);

  factory.$inject = ['$rootScope'];

  function factory($rootScope) {
    const service = $rootScope.cable.subscriptions.create("RoomChannel",
      {
        connected: function connected() {
          $rootScope.$broadcast('cable-connected', true)
          console.log('connected');
        },

        disconnected: function disconnected() {
          console.log('disconnected');
        },

        received: function received(data) {
          console.log('data received:', data);
          alert(data.message);
        },

        quit: function quit(room_id) {
          this.perform('quit', {room_id: room_id});
        },

        join: function join(room_id) {
          this.perform('join', {room_id: room_id})
        },

        speak: function speak(message) {
          this.perform('speak', {message: message});
        }
      }
    );

    return service;
  }
})();
