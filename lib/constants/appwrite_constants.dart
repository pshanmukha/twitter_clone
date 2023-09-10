class AppwriteConstants {
  static const String databaseId = "64e97d5707b6066e196b";
  static const String projectId = "64c87d9bcb1f8ab16b14";
  // for ios only
  //static const String endPoint = "http://localhost:80/v1";
  // for android & ios
  static const String endPoint = "http://192.168.1.102:80/v1";
  static const String usersCollection = "64e97d799335a33656cb";
  static const String tweetsCollection = "64ea504f1598b1e10cf3";
  static const String notificationsCollection = "64fca521f2bc7db1c15a";
  static const String imagesBucket = "64ea5cf0463eeec404dc";
  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
