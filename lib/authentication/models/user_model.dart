import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_chat/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String fullName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  //function to format phonenumber
  String get formattedPhoneNumber => YoFormatter.formatPhoneNumber(phoneNumber);

  // function to split fullname into first and last name
  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUserName(fullname) {
    List<String> nameParts = fullname.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseusername = "$firstName$lastName";
    String usernameWithPrefix = " yo_$camelCaseusername";

    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      fullName: '',
      username: '',
      email: '',
      phoneNumber: ' ',
      profilePicture: ' ');

  Map<String, dynamic> toJson() {
    return {
      'accessToken': id,
      'FullName': fullName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }


  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (fullName != null) "fullname": fullName,
      if (email != null) "email": email,
      if (username != null) "username": username,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (profilePicture != null) "profilePicture": profilePicture,
    };
  }

  


  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserModel(
       id: snapshot.id,
        fullName: snapshot['FullName'] ?? '',
        username: snapshot['Username'] ?? '',
        email: snapshot['Email'] ?? '',
        phoneNumber: snapshot['PhoneNumber'] ?? '',
        profilePicture: snapshot['ProfilePicture'] ?? '',
    );
  }


  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data['FullName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}

class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        photoUrl: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "email": email,
        "photoUrl": photoUrl,
      };
}

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;


  MeListItem({
    this.name,
    this.icon,
    this.explain,
    this.route,
  });

  factory MeListItem.fromJson(Map<String, dynamic> json) =>
      MeListItem(
        name: json["name"],
        icon: json["icon"],
        explain: json["explain"],
        route: json["route"],
      );
}
