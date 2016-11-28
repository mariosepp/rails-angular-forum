angular.module('forum')
  .factory('posts', ['$http', function($http){
    var o = {
      posts: []
    };

    o.getAll = function() {
      return $http.get('/posts.json').success(function(data){
        angular.copy(data, o.posts);
      });
    };

    o.addPost = function(post) {
      return $http.post('/posts.json', post).success(function(data){
        o.posts.push(data);
      });
    };

    o.destroyPost = function(id) {
      return $http.delete('/posts/' + id + '.json').success(function(data){
        o.getAll()
      });
    };

    o.get = function(id) {
      return $http.get('/posts/' + id + '.json').then(function(res){
        return res.data;
      });
    };

    o.addComment = function(id, comment) {
      return $http.post('/posts/' + id + '/comments.json', comment);
    };

    o.destroyComment = function(post_id, id) {
      return $http.delete('/posts/' + post_id + '/comments/' + id + '.json').success(function(data){
        o.getAll()
      });
    };

    return o;
  }])