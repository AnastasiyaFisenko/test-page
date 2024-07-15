import 'package:flutter/cupertino.dart';
import 'styles.dart';

class DateTimePickerWidget extends StatelessWidget {
  final DateTime initialDateTime;
  final CupertinoDatePickerMode mode;
  final ValueChanged<DateTime> onDateTimeChanged;

  const DateTimePickerWidget({
    super.key,
    required this.initialDateTime,
    required this.mode,
    required this.onDateTimeChanged,
  });

  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(
          context,
          CupertinoDatePicker(
            minimumDate: DateTime(1960),
            maximumDate: initialDateTime.add(
              Duration(days: 25500),
            ),
            initialDateTime: initialDateTime,
            mode: mode,
            use24hFormat: true,
            onDateTimeChanged: onDateTimeChanged,
          ),
        );
      },
      child: Container(
        height: 36,
        constraints: const BoxConstraints(minWidth: 64),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(242, 244, 247, 1),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mode == CupertinoDatePickerMode.date ? 12.5 : 15,
          ),
          child: Text(
            _formatDateTime(context, initialDateTime, mode),
            style: textDataField,
          ),
        ),
      ),
    );
  }

  String _formatDateTime(
      BuildContext context, DateTime dateTime, CupertinoDatePickerMode mode) {
    String formattedDate = "";
    if (mode == CupertinoDatePickerMode.date) {
      formattedDate =
          "${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}";
    } else if (mode == CupertinoDatePickerMode.time) {
      formattedDate =
          "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    }
    return formattedDate;
  }
}
