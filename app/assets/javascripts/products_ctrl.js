(function() {
  "use strict";

  angular.module("app").controller("productsCtrl", function($scope, $http){
    
    $scope.cartedProducts = [];

    $http.get("/api/v1/products.json").then(function (response) {
      $scope.products = response.data;
    });

    $http.get("/api/v1/carted_products.json").then(function (response) {
      $scope.cartedProducts = response.data;
    });

    $scope.toggleVisible = function(product) {
      product.priceVisible = !product.priceVisible;
    };

    $scope.addProduct = function(name, price, photo) {
      var newProduct = { name: name, price: price, photo: photo, priceVisible: false};
      $http.post('/api/v1/products.json', {product: newProduct}).then(function(response) {

        }, function (error) {
          $scope.error = error.statusText;
        });
      $scope.products.push(newProduct);
      $scope.newProductName = "";
      $scope.newPersonPrice = "";
      $scope.newPersonPhoto = "";
    };

    $scope.numberOfProducts = function() {
      return $scope.products.length;
    };

    $scope.deleteProduct = function(productIndex) {
      $scope.products.splice(productIndex, 1);
    };


    $scope.addToCart = function(product) {
      var newProduct = {
        name: product.name,
        quantity: 1,
        price: product.price,
        product_id: product.id,
        current_user_id: $scope.currentUserId
      }
      $http.post('/api/v1/carted_products.json', {carted_product: newProduct}).then(function(response) {
          $scope.cartedProducts.push(newProduct);
        }, function (error) {
          $scope.error = error.statusText;
        });
    };

    $scope.subtotal = function() {
      var subtotal = 0;
      for(var i = 0; i < $scope.cartedProducts.length; i++) {
        subtotal += $scope.cartedProducts[i].price;
      };
      return subtotal;
    };

    $scope.salesTax = function() {
      return $scope.subtotal() * 0.09;
    };

    $scope.total = function() {
      return $scope.subtotal() + $scope.salesTax();
    }

    window.scope = $scope;
  });

}());