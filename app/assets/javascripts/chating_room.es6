//= require action_cable
//= require_self
//= require_tree ./channels

(() => {
  'use strict';

  var croom = angular
    .module('croom', []).run(
      function ($rootScope) {
        $rootScope.cable = ActionCable.createConsumer();
        console.log('Cable is there');
      }
    );
})();
