(() => {
  'use strict';

  angular
    .module('croom')
    .factory('roomChannel', factory);

  factory.$inject = ['$rootScope'];

  function factory($rootScope) {
    // TODO: RoomChannel is room_channel in order to new channel we need to create new subscription
    const service = $rootScope.cable.subscriptions.create("RoomChannel",
      {
        connected: function () {
          $rootScope.$broadcast('cable-connected', true)
          console.log('connected');
        },

        disconnected: function () {
          console.log('disconnected');
        },

        received: function (data) {
          alert(data.message.content);
        },

        quit: function (roomId) {
          this.perform('quit', {roomId: roomId});
        },

        join: function (roomId) {
          this.perform('join', {roomId: roomId})
        },

        speak: function (data) {
          this.perform('speak', data);
        }
      }
    );

    return service;
  }
})();
