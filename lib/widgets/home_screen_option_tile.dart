import 'package:doctor_appointment_booking/utils/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreenTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const HomeScreenTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.symmetric(
          horizontal: MarginSize.marginSmall,
          vertical: MarginSize.marginMedium,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.borderRadiusCommon),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
