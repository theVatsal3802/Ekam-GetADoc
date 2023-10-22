import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/screens/select_package.dart';
import 'package:doctor_appointment_booking/utils/date_utils.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:doctor_appointment_booking/widgets/doctor_data.dart';
import 'package:doctor_appointment_booking/widgets/doctor_info.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  static const routeName = "/doctor-details";
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int dateIndex = -1;
  int timeIndex = -1;

  List<String> time = [
    "7:00 PM",
    "7:30 PM",
    "8:00 PM",
    "8:30 PM",
    "9:00 PM",
    "9:30 PM",
  ];

  String selectedDate = "";
  String selectedTime = "7:00 PM";

  void navigate(
    Doctor doctor,
    String date,
    String time,
  ) {
    if (selectedDate.isEmpty || selectedTime.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please select date and time before proceeding",
            textScaleFactor: 1,
          ),
        ),
      );
      return;
    }
    Navigator.of(context).pushNamed(
      SelectPackage.routeName,
      arguments: {
        "doctor": doctor,
        "date": date,
        "time": time,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctor;
    List<String> date = doctor.availability.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Appointment",
          textScaleFactor: 1,
        ),
      ),
      body: Column(
        children: [
          DoctorInfo(
            doctor: doctor,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorData(
                parameter: "Patients",
                value: doctor.patients_served.toString(),
                icon: Icons.people,
              ),
              DoctorData(
                parameter: "Years Exp.",
                value: doctor.years_of_experience.toString(),
                icon: Icons.work_history,
              ),
              DoctorData(
                parameter: "Rating",
                value: doctor.rating.toString(),
                icon: Icons.star,
              ),
              DoctorData(
                parameter: "Reviews",
                value: doctor.number_of_reviews.toString(),
                icon: Icons.message,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "BOOK APPOINTMENT",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Day",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 20,
                  ),
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: date.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingSize.paddingSmall),
                  child: ChoiceChip(
                    backgroundColor: dateIndex != index
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                    label: Text(DateUtil.getDocDetDate(date[index])),
                    selected: dateIndex == index,
                    onSelected: (value) {
                      setState(() {
                        dateIndex = index;
                        selectedDate = date[index];
                      });
                    },
                    side: dateIndex != index
                        ? const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          )
                        : null,
                    padding: const EdgeInsets.all(PaddingSize.paddingLarge),
                    labelStyle: TextStyle(
                      color: dateIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Time",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 20,
                  ),
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: time.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingSize.paddingSmall),
                  child: ChoiceChip(
                    backgroundColor: timeIndex != index
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                    label: Text(time[index]),
                    selected: timeIndex == index,
                    onSelected: (value) {
                      setState(() {
                        timeIndex = index;
                        selectedTime = time[timeIndex];
                      });
                    },
                    side: timeIndex != index
                        ? const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          )
                        : null,
                    padding: const EdgeInsets.all(PaddingSize.paddingLarge),
                    labelStyle: TextStyle(
                      color: timeIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
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
                navigate(doctor, selectedDate, selectedTime);
              },
              child: const Text(
                "Make Appointment",
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
        ],
      ),
    );
  }
}
