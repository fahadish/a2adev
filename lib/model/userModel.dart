import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final bool certified;
  final String certifiedImage;
  final String company;
  final String phone;
  final String phoneW;
  final String email;
  final String name;
  final String location;
  final String experience;
  final String status;
  final List<String> specialty;
  final String profileImage;

  UserModel({
    required this.certified,
    required this.certifiedImage,
    required this.company,
    required this.phone,
    required this.phoneW,
    required this.email,
    required this.name,
    required this.location,
    required this.experience,
    required this.status,
    required this.specialty,
    required this.profileImage,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      certified: data['certified'],
      certifiedImage: data['certified_image'],
      company: data['company'],
      phone: data['phone'],
      phoneW: data['phoneW'],
      email: data['email'],
      name: data['name'],
      location: data['location'],
      experience: data['experience'],
      status: data['status'],
      specialty: List<String>.from(data['specialty']),
      profileImage: data['profile_image'],
    );
  }
}
