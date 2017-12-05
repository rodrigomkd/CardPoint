var realCenterApp = angular.module('starter',['ngRoute','ngSanitize', 'ngCsv']);
 
realCenterApp.config(['$routeProvider', '$locationProvider' , function($routeProvider, $locationProvider) {	
	//$locationProvider.html5Mode(true);
	//.hashPrefix('!');	
	
	$routeProvider
		// ---------------------------------------------------------------------------		
		.when('/home',{
			templateUrl: 'cardpoint/index.html',
			//controller: 'HomeController' 	
		// CLIENTS
		// ---------------------------------------------------------------------------		
		}).when('/list-clients',{
			templateUrl: 'cardpoint/templates/points.html',
			controller: 'PointsCtrl'
		}).when('/client/:clientId',{
			templateUrl: 'cardpoint/templates/view-client.html',
			controller: 'ClientViewCtrl'
		}).when('/list-clients-verification/:active',{
			templateUrl: 'cardpoint/templates/list_clients_verification.html',
			controller: 'ClientsVerificationCtrl'
		}).when('/list-client-comments/:clientId',{
			templateUrl: 'cardpoint/templates/list_client_comments.html',
			controller: 'ListClientCommentsCtrl'
		}).when('/view-client-comment/:commentId',{
			templateUrl: 'cardpoint/templates/view_client_comment.html',
			controller: 'ClientCommentCtrl'
					
		// POINTS
		// ---------------------------------------------------------------------------		
		/*
		}).when('/points',{
			templateUrl: 'cardpoint/templates/points.html',
			controller: 'PointsCtrl'
		*/
		}).when('/point',{
			templateUrl: 'cardpoint/templates/view-point.html',
			controller: 'PointViewCtrl'
		}).when('/list-points',{
			templateUrl: 'cardpoint/templates/list-points.html',
			controller: 'PointsListCtrl'
		}).when('/list-points-commerce',{
			templateUrl: 'cardpoint/templates/list_points_commerces.html',
			controller: 'PointsListCommercesCtrl'
		}).when('/list-points-commerce-details/:commerceid',{
			templateUrl: 'cardpoint/templates/list_points_commerces_details.html',
			controller: 'PointsListCommercesDetailsCtrl'
		}).when('/list-points-credential',{
			templateUrl: 'cardpoint/templates/list_points_credentials.html',
			controller: 'PointsListCredentialsCtrl'
		}).when('/list-points-credential-details/:clientid',{
			templateUrl: 'cardpoint/templates/list_points_credentials_details.html',
			controller: 'PointsListCredentialsDetailsCtrl'
		}).when('/list-points-credential-details-commerce/:ids',{
			templateUrl: 'cardpoint/templates/list_points_credentials_details_commerce.html',
			controller: 'PointsListCredentialsDetailsCommerceCtrl'
				
		// POINTS
		// ---------------------------------------------------------------------------
		}).when('/points-register',{
			templateUrl: 'cardpoint/templates/points_register.html',
			controller: 'PointsRegisterCtrl'
		
		// COMMERCES
		}).when('/list-categories',{
			templateUrl: 'cardpoint/templates/list_categories.html',
			controller: 'CategoriesCtrl'
		}).when('/view-category/:commercetypeid',{
			templateUrl: 'cardpoint/templates/view_category.html',
			controller: 'CategoryCtrl'
		}).when('/list-commerces',{
			templateUrl: 'cardpoint/templates/list_commerces.html',
			controller: 'CommercesCtrl'
		}).when('/view-commerce/:commerceid',{
			templateUrl: 'cardpoint/templates/view_commerce.html',
			controller: 'CommerceViewCtrl'
			
		// USERS
		}).when('/list-users',{
			templateUrl: 'cardpoint/templates/list_users.html',
			controller: 'UsersCtrl'
		}).when('/view-user/:userid',{
			templateUrl: 'cardpoint/templates/view_user.html',
			controller: 'UserViewCtrl'
		}).when('/register-user/:userid',{
			templateUrl: 'cardpoint/templates/register.html',
			controller: 'RegisterCtrl'
			
		// LOGIN
		}).when('/login',{
			templateUrl: 'cardpoint/templates/login.html',
			controller: 'LoginCtrl'
		}).when('/request-password',{
			templateUrl: 'cardpoint/templates/request_password.html',
			controller: 'RequestPasswordCtrl'
		}).when('/change-password',{
			templateUrl: 'cardpoint/templates/change_password.html',
			controller: 'ChangePasswordCtrl'
			
		// REPORTS
		}).when('/report-card-points',{
			templateUrl: 'cardpoint/templates/report_card_points.html',
			controller: 'ReportCardPointsCtrl'
		}).when('/report-card-points-acum',{
			templateUrl: 'cardpoint/templates/report_card_points_acum.html',
			controller: 'ReportCardPointsAcumCtrl'
		}).when('/report-client-points',{
			templateUrl: 'cardpoint/templates/report_client_points.html',
			controller: 'ReportClientPointsCtrl'
		}).when('/report-client-register',{
			templateUrl: 'cardpoint/templates/report_client_register.html',
			controller: 'ReportClientRegisterCtrl'
		
		//CONFIG
		}).when('/view-config-email',{
			templateUrl: 'cardpoint/templates/view_config_email.html',
			controller: 'ViewConfigEmailCtrl'
		// DEFAULT
		// ---------------------------------------------------------------------------		
		}).otherwise({
			redirectTo:'/notfound'
		});
	}
])

realCenterApp.controller('PointsCtrl', function($scope, $http, $log) {
	alert("entra a points");
	$http.get('http://127.0.0.1/realcenter/popData.php')
        .success(function(data) {
            $scope.clients = data;
			//alert(data);
        })
        .error(function(data,status,headers,config) {
			//alert(status);
            $log.error(data);
	})
})
;