import 'package:doctor_appointment_booking/models/booking_model.dart';
import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/utils/date_utils.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:flutter/material.dart';

class BookingInfo extends StatelessWidget {
  final Booking booking;
  final Doctor doctor;
  const BookingInfo({
    super.key,
    required this.booking,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: MarginSize.marginLarge,
        vertical: MarginSize.marginSmall,
      ),
      padding: const EdgeInsets.all(PaddingSize.paddingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusSize.borderRadiusCommon),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${DateUtil.getBookingDate(booking.appointment_date)} - ${booking.appointment_time}",
            textScaleFactor: 1,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          const Divider(
            thickness: 1,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.circular(RadiusSize.borderRadiusSmall),
                  ),
                  child: Image.network(doctor.image, fit: BoxFit.contain),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.doctor_name,
                      textScaleFactor: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          booking.location,
                          textScaleFactor: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.flip,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Booking Id: ",
                          textScaleFactor: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          booking.booking_id,
                          textScaleFactor: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(PaddingSize.paddingLarge),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    textScaleFactor: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(PaddingSize.paddingLarge),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Reschedule",
                    textScaleFactor: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
