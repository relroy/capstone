(function() {
  "use strict";

  angular.module("app").controller("productsCtrl", function($scope, $http){
    
    $scope.cartedProducts = [];
    // getting products here
    $http.get("/api/v1/products.json").then(function (response) {
      $scope.products = response.data;
    });
    // getting carted products here
    $http.get("/api/v1/carted_products.json").then(function (response) {
      $scope.cartedProducts = response.data;
    });
    // getting syrup flavors here

    $http.get("/api/v1/syrup_flavors.json").then(function (response) {
        $scope.flavors = response.data;
      });

    // $scope.toggleVisible = function(product) {
    //   product.priceVisible = !product.priceVisible;
    // };

    // $scope.addProduct = function(name, price, photo) {
    //   var newProduct = { name: name, price: price, photo: photo, priceVisible: false};
    //   $http.post('/api/v1/products.json', {product: newProduct}).then(function(response) {

    //     }, function (error) {
    //       $scope.error = error.statusText;
    //     });
    //   $scope.products.push(newProduct);
    //   $scope.newProductName = "";
    //   $scope.newProductPrice = "";
    //   $scope.newProductPhoto = "";
    // };

    // $scope.numberOfProducts = function() {
    //   return $scope.products.length;
    // };

    // $scope.deleteProduct = function(productIndex) {
    //   $scope.products.splice(productIndex, 1);
    // };

    // defining what the new product is that will be pushed to the carted product json
    $scope.addToCart = function(product) {
      var newProduct = {
        name: product.name,
        quantity: 1,
        price: product.price,
        product_id: product.id,
        current_user_id: $scope.currentUserId,
        photo: product.photo
      }
      // posting the new carted product defined above to the json
      $http.post('/api/v1/carted_products.json', {carted_product: newProduct}).then(function(response) {
        console.log($scope.cartedProducts)
          $scope.cartedProducts.push(newProduct);
          $scope.currentCartedProductId = response.data.id;
          $scope.currentCartedProduct = newProduct;
        }, function (error) {
          $scope.error = error.statusText;
        });

    };
    // adding the carted product flavor here
    $scope.updateFlavor = function(flavor) {
      console.log(flavor);
      var updatedProduct = { syrup_flavor_id: flavor.id, };
      $http.patch('/api/v1/carted_products/' + $scope.currentCartedProductId + '.json', {carted_product: updatedProduct}).then(function(response) {
          $scope.currentCartedProduct.flavor = flavor.name;
        }, function (error) {
          $scope.error = error.statusText;
        });
    };

    $scope.updateCartedProduct = function(cartedProduct) {
      console.log(cartedProduct);
      $scope.currentCartedProduct = cartedProduct;     
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