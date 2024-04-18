import 'package:coconut_disease_detection/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String userName;
  String nationalID;
  String email;
  String phoneNumber;
  String address;
  String profilePicture;

  //constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.nationalID,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.profilePicture,
  });

//helper function to get fullname
  String get fullName => '$firstName $lastName';

//split function of fullname into first & last
  static List<String> nameParts(fullName) => fullName.split(' ');

//username function generated from fullname
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

//helper function to format phone number
  String get formattedPhoneNo => CFormatter.formatPhoneNumber(phoneNumber);

//static function to create an empty model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        nationalID: '',
        email: '',
        phoneNumber: '',
        address: '',
        profilePicture: '',
      );

//convert model to JSON structure for store in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'NationalID': nationalID,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Address': address,
      'ProfilePicture': profilePicture,
    };
  }

//factory method to create a usermodel from a firebase document snapshot
  //factory UserModel.fromSnapshot(
  //DocumentSnapshot<Map<String, dynamic>> document) {
  //if (document.data() != null) {
  //final data = document.data()!;

  //return UserModel(
  //id: document.id,
  //firstName: data['FirstName'] ?? '',
  //lastName: data['LastName'] ?? '',
  //userName: data['UserName'] ?? '',
  //nationalID: data['NationalID'] ?? '',
  //email: data['Email'] ?? '',
  //phoneNumber: data['PhoneNumber'] ?? '',
  //address: data['Address'] ?? '',
  //profilePicture: data['ProfilePicture'] ?? '',
  //);
  //}
  //}
}
