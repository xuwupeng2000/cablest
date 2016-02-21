(() => {
  'use strict';

  angular
    .module('croom')
    .controller('RoomsController', controller);

  controller.$inject = ['$log', '$q', '$scope', '$rootScope', 'roomChannel'];

  function controller($log, $q, $scope, $rootScope, roomChannel) {
    $scope.subscribeToRoomChannel = subscribeToRoomChannel;
    $scope.submit = submitNewMessage;
    $scope.message = {};

    activate();

    function submitNewMessage($event) {
      $event.preventDefault()
      let data = {message: $scope.message, room_id: gon.room_id};
      roomChannel.speak(data);
    }

    function subscribeToRoomChannel() {
      roomChannel.join(gon.room.id);
    }

    function activate() {
      $log.debug('RoomController init');
      $scope.$on('cable-connected', function () {
        subscribeToRoomChannel();

      });
    }
  }
})();
