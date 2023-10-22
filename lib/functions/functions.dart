import 'dart:convert';

import 'package:doctor_appointment_booking/models/booking_model.dart';
import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/utils/assets.dart';
import 'package:http/http.dart' as http;

class Functions {
  static Future<List<Booking>> getBookings() async {
    final response = await http.get(Uri.parse(Assets.bookingsUrl));
    List<Booking> bookings = [];
    final bookingList = json.decode(response.body);
    for (var booking in bookingList) {
      bookings.add(Booking.fromMap(booking));
    }
    return bookings;
  }

  static Future<List<Doctor>> getDoctors() async {
    final response = await http.get(Uri.parse(Assets.doctorDataUrl));
    List<Doctor> doctors = [];
    final doctorList = json.decode(response.body);
    for (Map<String, dynamic> doctor in doctorList) {
      doctors.add(Doctor.fromMap(doctor));
    }
    return doctors;
  }

  static Future<Map<String, dynamic>> getBookingConfirmation() async {
    final response = await http.get(Uri.parse(Assets.confirmBookingUrl));
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> getPackageDetails() async {
    final response = await http.get(Uri.parse(Assets.packageOptionsUrl));
    final Map<String, dynamic> packageData = json.decode(response.body);
    return packageData;
  }
}
