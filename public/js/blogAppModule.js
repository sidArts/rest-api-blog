var app = angular.module("blogApp", []);

app.run(['$http', function ($http) {
    $http.defaults.headers.common['x-access-token'] = document.getElementById('Authorization').value;
}]);

app.controller("blogAppController", function($scope, $http) {

	$scope.allPost = [];

	$scope.popularPosts = [];
	$scope.mostLikedPosts = [];
	$scope.latestPosts = [];


	$scope.login = {};
	$scope.loggedInUser = {};

	$scope.alertType = '';
	$scope.alertMessage = '';

	$scope.getPosts = function(type) {
		$http({
			url: "/getPosts/"+ type,
			method: "GET"
		}).then(function(res){
			switch(type) {
				case "popular":
	            $scope.popularPosts = res.data;
	            break;
	        case "latest":
	            $scope.latestPosts = res.data;
	            break;
	        case "mostLiked":
	            $scope.mostLikedPosts = res.data;
	            break;
			}

		}, function(err){ console.log(err); });
	};

	var getAllPost = function() {
		$http({
			url: "/post/getAll",
			method: "GET"
		}).then(function(res){
			$scope.allPost = res.data;
			angular.forEach($scope.allPost, function(value, key){
				value.descView = false;
				value.comments = [];
				value.commentView = false;
				value.userDetails = {};
				getPostCommentsByPostId(value);
				getUserDetailsById(value);
				getLikeCountPostId(value);
			});
		}, function(err){ console.log(err); });
	}

	var getPostCommentsByPostId = function(post) {
		$http({
			url: "/comment/getByPostId/"+ post.post_id,
			method: "GET"
		}).then(function(res){
			post.comments = res.data;
			angular.forEach(post.comments, function(value, key){
				value.userDetails = {};
				getUserDetailsById(value);
			});
		}, function(err){ console.log(err); });
	};

	var getUserDetailsById = function(user) {
		$http({
			url: "/user/get/"+ user.user_id,
			method: "GET"
		}).then(function(res){
			user.userDetails = res.data;
		}, function(err){ console.log(err); });
	};

	var getLikeCountPostId = function(post) {
		
		$http({
			url: "/like/likeCountByPostId/"+ post.post_id,
			method: "GET"
		}).then(function(res){
			post.likeCount = res.data.likes;
		}, function(err){ console.log(err); });
			
	};

	var likePost = function(post) {
		$http({
			url: "/like/likePost",
			method: "POST",
			data: { postId: post.post_id}
		}).then(function(res){
			++post.likeCount ;
		}, function(err){ console.log(err); });
	};

	$scope.viewComment = function(post, hidden) {
		post.commentView = hidden;
	};

	$scope.showHidePost = function(post, state) {
		post.descView = state;
	};

	$scope.authorizeUser = function() {
		$http({
			url: "/auth",
			method: "POST",
			data: angular.copy($scope.login)
		}).then(function(res){
			console.log(res);
			$scope.loggedInUser = res.data;
			document.getElementById("Authorization").value = res.headers("x-access-token");
			$http.defaults.headers.common['x-access-token'] = document.getElementById('Authorization').value;
			getAllPost();
			$("#loginModal").modal("hide");
		}, function(err){ console.log(err); });
	};

	$scope.logout = function () {
		$http({
			url: "/logout",
			method: "POST"
		}).then(function(res){
			$scope.alertMessage = "You are now logged out!";
			$scope.alertType = "success";
			$scope.loggedInUser = {};
			$scope.allPost = [];
		}, function(err){ console.log(err); });
	};



	$scope.getPosts("popular");
});