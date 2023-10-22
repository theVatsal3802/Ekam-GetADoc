import 'package:doctor_appointment_booking/models/doctor_model.dart';
import 'package:doctor_appointment_booking/models/package_model.dart';
import 'package:doctor_appointment_booking/screens/review_summary.dart';
import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:flutter/material.dart';

class SelectPackage extends StatefulWidget {
  static const routeName = "/select-package";
  const SelectPackage({super.key});

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  List<String> durations = [
    "30 minutes",
    "60 minutes",
  ];

  String selectedDuration = "30 minutes";
  String? selectedPackage;

  void navigate(
    String duration,
    String? package,
    Doctor doctor,
    String date,
    String time,
  ) {
    if (duration.isEmpty || package == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please select a duration and package before proceeding",
            textScaleFactor: 1,
          ),
        ),
      );
      return;
    }
    Navigator.of(context).pushNamed(
      ReviewSummary.routeName,
      arguments: {
        "doctor": doctor,
        "package": package,
        "duration": duration,
        "date": date,
        "time": time,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Package",
          textScaleFactor: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Duration",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSize.paddingLarge,
                vertical: PaddingSize.paddingExtraSmall,
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(RadiusSize.borderRadiusSmall),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButton(
                      underline: Container(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      value: selectedDuration,
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          selectedDuration = value!;
                        });
                      },
                      items: durations.map(
                        (String val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              textScaleFactor: 1,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Select Package",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            StatefulBuilder(builder: (context, StateSetter set) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: Package.packages
                    .map(
                      (package) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: PaddingSize.paddingExtraSmall,
                          vertical: PaddingSize.paddingExtraSmall,
                        ),
                        child: RadioListTile<String>(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiusSize.borderRadiusSmall),
                              side: BorderSide(
                                width: 1,
                                color: Colors.grey.shade300,
                              )),
                          activeColor: Theme.of(context).colorScheme.primary,
                          controlAffinity: ListTileControlAffinity.trailing,
                          subtitle: Text(
                            package.description,
                            textScaleFactor: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          title: Text(
                            package.title,
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: package.title,
                          groupValue: selectedPackage ?? "",
                          secondary: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            radius: RadiusSize.radMedium,
                            child: Icon(
                              package.icon,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onChanged: (value) {
                            set(() {
                              selectedPackage = value;
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              );
            }),
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
                  navigate(
                    selectedDuration,
                    selectedPackage,
                    data["doctor"],
                    data["date"],
                    data["time"],
                  );
                },
                child: const Text(
                  "Next",
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
