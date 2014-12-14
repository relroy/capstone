(function() {
  "use strict";

  angular.module("app").controller("driversCtrl", function($scope, $http){

    $http.get("/api/v1/drivers.json").then(function (response) {
      $scope.drivers = response.data;
    });

    $scope.selectDriver = function(driver){
      $scope.greeting = "You're driver, " + (driver.name) + " will be on their way! You should expect your Ice cream within 30 minutes!";
      driver.available = !driver.available
      $scope.drivers = !$scope.drivers 
    };
    $scope.droneFly = function(drone){
//       var Cylon = require('cylon');

// Cylon.robot({
//   connection: { name: 'ardrone', adaptor: 'ardrone', port: '192.168.1.1' },
//   device: { name: 'drone', driver: 'ardrone' },

//   work: function(my) {
//     my.drone.takeoff();

//     after((5).seconds(), function() {
//       my.drone.land();
//     });

//     after((10).seconds(), function() {
//       my.drone.stop();
//     });
//   }
// }).start();
//     };
    // $scope.toggleVisible = function(driver) {
    //      driver.driverVisible = !driver.driverVisible;
    //    };
      window.scope = $scope;
    });

}());