import 'package:doctor_appointment_booking/screens/booking_confirmation.dart';
import 'package:doctor_appointment_booking/utils/date_utils.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:doctor_appointment_booking/widgets/doctor_info.dart';
import 'package:doctor_appointment_booking/widgets/review_info.dart';
import 'package:flutter/material.dart';

class ReviewSummary extends StatelessWidget {
  static const routeName = "/review-summary";
  const ReviewSummary({super.key});

  void navigate(BuildContext context, Map<String, dynamic> bookingData) {
    Navigator.of(context).pushReplacementNamed(
      BookingConfirmation.routeName,
      arguments: bookingData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookingData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Review Summary",
          textScaleFactor: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.paddingSmall),
        child: Column(
          children: [
            DoctorInfo(
              doctor: bookingData["doctor"],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            ReviewInfo(
              title: "Date & Hour",
              value: DateUtil.getReviewDate(
                bookingData["date"],
                bookingData["time"],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ReviewInfo(
              title: "Package",
              value: bookingData["package"],
            ),
            const SizedBox(
              height: 20,
            ),
            ReviewInfo(
              title: "Duration",
              value: bookingData["duration"],
            ),
            const SizedBox(
              height: 20,
            ),
            const ReviewInfo(
              title: "Booking for",
              value: "Self",
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                onPressed: () {
                  navigate(context, bookingData);
                },
                child: const Text(
                  "Confirm",
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
                Navigator.of(context).pop();
              },
              child: const Text(
                "Edit Appointment",
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
