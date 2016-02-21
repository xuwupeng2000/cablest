(() => {
  'use strict';

  angular
    .module('croom')
    .controller('RoomsController', controller);

  controller.$inject = ['$log', '$q', '$scope', '$rootScope', 'roomChannel'];

  function controller($log, $q, $scope, $rootScope, roomChannel) {
    $scope.subscribeToRoomChannel = subscribeToRoomChannel;
    activate();

    function subscribeToRoomChannel() {
      // TODO: Promise then click
      $log.debug(roomChannel);
      $log.debug(gon.room.id);
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
