class EndPoint {
  static const String baseUrl = '134.209.132.80/api/';
  static String register = 'auth/register';
  // static String profile({required int id}) => 'auth/profile/${id}' ;
  static String profile = "auth/profile";
  static String login = 'auth/login';
  static String updateProfile = 'user/profile';
  static String suggestedJob = 'jobs/sugest';
  static String userToken = '';
  static int userId = 0;
}
