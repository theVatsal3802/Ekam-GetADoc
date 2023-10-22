import 'package:doctor_appointment_booking/functions/functions.dart';
import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/widgets/doctor_tile.dart';
import 'package:flutter/material.dart';

class AllDoctorScreen extends StatefulWidget {
  static const routeName = "/all-doctors";
  const AllDoctorScreen({super.key});

  @override
  State<AllDoctorScreen> createState() => _AllDoctorScreenState();
}

class _AllDoctorScreenState extends State<AllDoctorScreen> {
  late Future<List<Doctor>> doctors;
  @override
  void initState() {
    super.initState();
    doctors = Functions.getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Doctor",
          textScaleFactor: 1,
        ),
      ),
      body: FutureBuilder(
          future: doctors,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "No Doctors available as of now.",
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return DoctorTile(
                  doctor: snapshot.data![index],
                );
              },
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}
