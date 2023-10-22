import 'package:doctor_appointment_booking/screens/all_doctor_screen.dart';
import 'package:doctor_appointment_booking/screens/view_bookings.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:doctor_appointment_booking/widgets/home_screen_option_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetADoc: Doctor Anytime, Anywhere",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PaddingSize.paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What do you want today?",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreenTile(
                  icon: Icons.person,
                  text: "Book Appointment",
                  onTap: () {
                    Navigator.of(context).pushNamed(AllDoctorScreen.routeName);
                  },
                ),
                HomeScreenTile(
                  icon: Icons.history,
                  text: "View My Bookings",
                  onTap: () {
                    Navigator.of(context).pushNamed(ViewBooking.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
