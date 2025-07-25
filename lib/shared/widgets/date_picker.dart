import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final Locale? locale;

  const DatePicker({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
          locale: locale,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: primary,
                  onPrimary: white,
                  onSurface: textPrimary,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: primary,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          onChanged(picked);
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: grey300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                value != null
                    ? "${(value!.year % 100).toString().padLeft(2, '0')}-${value!.month.toString().padLeft(2, '0')}-${value!.day.toString().padLeft(2, '0')}"
                    : label,
                style: TextStyle(
                  fontSize: 16,
                  color: textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.calendar_today,
              size: 20,
              color: textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
