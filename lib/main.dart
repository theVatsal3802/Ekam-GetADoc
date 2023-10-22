import 'package:doctor_appointment_booking/screens/all_doctor_screen.dart';
import 'package:doctor_appointment_booking/screens/booking_confirmation.dart';
import 'package:doctor_appointment_booking/screens/doctor_details.dart';
import 'package:doctor_appointment_booking/screens/home_screen.dart';
import 'package:doctor_appointment_booking/screens/review_summary.dart';
import 'package:doctor_appointment_booking/screens/select_package.dart';
import 'package:doctor_appointment_booking/screens/view_bookings.dart';
import 'package:doctor_appointment_booking/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment Booking',
      theme: theme(),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AllDoctorScreen.routeName: (context) => const AllDoctorScreen(),
        BookingConfirmation.routeName: (context) => const BookingConfirmation(),
        DoctorDetails.routeName: (context) => const DoctorDetails(),
        ReviewSummary.routeName: (context) => const ReviewSummary(),
        SelectPackage.routeName: (context) => const SelectPackage(),
        ViewBooking.routeName: (context) => const ViewBooking(),
      },
    );
  }
}
