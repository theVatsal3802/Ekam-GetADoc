// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class Booking {
  final String booking_id;
  final String doctor_name;
  final String location;
  final String appointment_date;
  final String appointment_time;
  Booking({
    required this.booking_id,
    required this.doctor_name,
    required this.location,
    required this.appointment_date,
    required this.appointment_time,
  });

  Booking copyWith({
    String? booking_id,
    String? doctor_name,
    String? location,
    String? appointment_date,
    String? appointment_time,
  }) {
    return Booking(
      booking_id: booking_id ?? this.booking_id,
      doctor_name: doctor_name ?? this.doctor_name,
      location: location ?? this.location,
      appointment_date: appointment_date ?? this.appointment_date,
      appointment_time: appointment_time ?? this.appointment_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'booking_id': booking_id,
      'doctor_name': doctor_name,
      'location': location,
      'appointment_date': appointment_date,
      'appointment_time': appointment_time,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      booking_id: map['booking_id'] as String,
      doctor_name: map['doctor_name'] as String,
      location: map['location'] as String,
      appointment_date: map['appointment_date'] as String,
      appointment_time: map['appointment_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);
}
