import 'package:doctor_appointment_booking/screens/home_screen.dart';
import 'package:doctor_appointment_booking/screens/view_bookings.dart';
import 'package:doctor_appointment_booking/utils/assets.dart';
import 'package:doctor_appointment_booking/utils/date_utils.dart';
import 'package:doctor_appointment_booking/widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingConfirmation extends StatelessWidget {
  static const routeName = "/booking-confirmation";
  const BookingConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirmation",
          textScaleFactor: 1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SvgPicture.asset(
              Assets.confirm,
              color: Theme.of(context).colorScheme.primary,
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Appointment confirmed!",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You have successfully booked appointment with",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              bookingData["doctor"].doctor_name,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            const InfoRow(
              icon: Icons.person,
              text: "Esther Howard",
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              children: [
                InfoRow(
                  icon: Icons.calendar_month,
                  text: DateUtil.getConfirmDate(bookingData["date"]),
                ),
                InfoRow(
                  icon: Icons.timer,
                  text: bookingData["time"],
                ),
              ],
            ),
            const Spacer(),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    ViewBooking.routeName,
                    (route) => false,
                  );
                },
                child: const Text(
                  "View Appointments",
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeScreen.routeName,
                  (route) => false,
                );
              },
              child: const Text(
                "Book Another",
                textScaleFactor: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
