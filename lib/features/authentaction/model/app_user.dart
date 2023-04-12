import 'package:labbaik/shared/enums/user_type.dart';
class AppUser  {
  String? uid;
  String? userName;
  String? phoneNumber;
  String? image;
  UserType? userType;
  AppUser({
    this.uid,
    this.userName,
    this.phoneNumber,
    this.image,
    this.userType,
  });
  factory AppUser.fromJson(Map<String, dynamic> parsedJson) {
    return AppUser(
      uid: parsedJson['uid'] ?? "",
      userName: parsedJson['name'] ?? "",
      phoneNumber: parsedJson['phone'] ?? "",
      image: parsedJson['image'] ?? "",
      userType: UserTypeHelper.convertTouType(parsedJson['user_type'] as String), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": userName,
      "phone": phoneNumber,
      "image": image,
      "user_type": UserTypeHelper.getCollectionValue(userType!) ,
    };
  }
  
}
