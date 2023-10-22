import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/screens/doctor_details.dart';
import 'package:flutter/material.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  const DoctorTile({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(
            DoctorDetails.routeName,
            arguments: doctor,
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(doctor.image),
        ),
        title: Text(
          doctor.doctor_name,
          textScaleFactor: 1,
        ),
        subtitle: Text(
          doctor.speciality,
          textScaleFactor: 1,
        ),
        trailing: Text(
          "${doctor.rating.toString()} ⭐",
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
