import 'package:doctor_appointment_booking/functions/functions.dart';
import 'package:doctor_appointment_booking/models/booking_model.dart';
import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/widgets/booking_info.dart';
import 'package:flutter/material.dart';

class ViewBooking extends StatefulWidget {
  static const routeName = "/view-bookings";
  const ViewBooking({super.key});

  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  Future<List<Booking>>? bookings;
  Future<List<Doctor>>? doctor;

  @override
  void initState() {
    super.initState();
    bookings = Functions.getBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Bookings",
          textScaleFactor: 1,
        ),
      ),
      body: FutureBuilder(
        future: bookings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No Bookings till now!",
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            );
          }
          return FutureBuilder(
            future: Functions.getDoctors(),
            builder: (context, doctorSnapshot) {
              if (doctorSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (!doctorSnapshot.hasData) {
                return Center(
                  child: Text(
                    "Some Error occured",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return BookingInfo(
                    booking: snapshot.data![index],
                    doctor: doctorSnapshot.data!
                        .where((doc) =>
                            doc.doctor_name ==
                            snapshot.data![index].doctor_name)
                        .first,
                  );
                },
                itemCount: 4,
              );
            },
          );
        },
      ),
    );
  }
}
