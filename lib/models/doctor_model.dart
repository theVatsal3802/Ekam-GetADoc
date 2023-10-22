// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class Doctor {
  final String doctor_name;
  final String image;
  final String speciality;
  final String location;
  final int patients_served;
  final int years_of_experience;
  final double rating;
  final int number_of_reviews;
  final Map<String, dynamic> availability;
  Doctor({
    required this.doctor_name,
    required this.image,
    required this.speciality,
    required this.location,
    required this.patients_served,
    required this.years_of_experience,
    required this.rating,
    required this.number_of_reviews,
    required this.availability,
  });

  Doctor copyWith({
    String? doctor_name,
    String? image,
    String? speciality,
    String? location,
    int? patients_served,
    int? years_of_experience,
    double? rating,
    int? number_of_reviews,
    Map<String, List<String>>? availability,
  }) {
    return Doctor(
      doctor_name: doctor_name ?? this.doctor_name,
      image: image ?? this.image,
      speciality: speciality ?? this.speciality,
      location: location ?? this.location,
      patients_served: patients_served ?? this.patients_served,
      years_of_experience: years_of_experience ?? this.years_of_experience,
      rating: rating ?? this.rating,
      number_of_reviews: number_of_reviews ?? this.number_of_reviews,
      availability: availability ?? this.availability,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctor_name': doctor_name,
      'image': image,
      'speciality': speciality,
      'location': location,
      'patients_served': patients_served,
      'years_of_experience': years_of_experience,
      'rating': rating,
      'number_of_reviews': number_of_reviews,
      'availability': availability,
    };
  }

  static Doctor fromMap(Map<String, dynamic> map) {
    return Doctor(
      doctor_name: map["doctor_name"],
      image: map["image"],
      speciality: map["speciality"],
      location: map["location"],
      patients_served: map["patients_served"],
      years_of_experience: map["years_of_experience"],
      rating: map["rating"],
      number_of_reviews: map["number_of_reviews"],
      availability: map["availability"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) =>
      Doctor.fromMap(json.decode(source) as Map<String, dynamic>);
}
