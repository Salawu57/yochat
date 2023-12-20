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
      'FullName': fullName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       fullName: data['FullName'] ?? '',
  //       username: data['Username'] ?? '',
  //       email: data['Email'] ?? '',
  //       phoneNumber: data['PhoneNumber'] ?? '',
  //       profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   }
  // }
}
