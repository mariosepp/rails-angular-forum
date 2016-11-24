angular.module('forum')
  .controller('MainCtrl', [
    '$scope',
    '$state',
    'posts',
    function($scope, $state, posts){
      $scope.posts = posts.posts;

      $scope.addPost = function(){
        if(!$scope.title || $scope.title === '') return;
        if(!$scope.content || $scope.content === '') return;

        posts.addPost({
          title: $scope.title,
          content: $scope.content,
        });
        $scope.title = '';
        $scope.content = '';

        $state.go('home');
      };

      $scope.destroyPost = function(id){
        posts.destroyPost(id);
      };
  }])