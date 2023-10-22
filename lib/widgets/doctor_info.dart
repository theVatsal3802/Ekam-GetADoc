import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/utils/assets.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final Doctor doctor;
  const DoctorInfo({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(PaddingSize.paddingSmall),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: RadiusSize.radLarge,
                  backgroundImage: NetworkImage(doctor.image),
                ),
              ),
              Positioned(
                left: 85,
                top: 75,
                child: Image.asset(
                  Assets.verified,
                  height: 28,
                  width: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                doctor.doctor_name,
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                doctor.speciality,
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      doctor.location,
                      textScaleFactor: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      softWrap: true,
                    ),
                  ),
                  Icon(
                    Icons.map,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
