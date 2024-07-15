import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/date_picker_widget.dart';
import 'styles.dart';

class SimpleFormFieldWidget extends StatefulWidget {
  SimpleFormFieldWidget({
    super.key,
    required this.data,
    this.maxLinesField = 1,
    required this.onFuncValid,
    required this.controller,
  });

  String data;
  final maxLinesField;
  final String? Function(String?) onFuncValid;
  TextEditingController controller;

  @override
  State<SimpleFormFieldWidget> createState() => _SimpleFormFieldWidgetState();
}

class _SimpleFormFieldWidgetState extends State<SimpleFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLinesField,
      decoration: InputDecoration(
        hintText: widget.data,
        hintStyle: textHintField,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      validator: widget.onFuncValid,
    );
  }
}

class PasswordFieldWidget extends StatefulWidget {
  PasswordFieldWidget({
    super.key,
    required this.data,
    required this.onFuncValid,
    required this.controller,
  });
  String data;
  final String? Function(String?) onFuncValid;
  TextEditingController controller;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.data,
        hintStyle: textHintField,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        suffixIcon: IconButton(
          icon: _isObscure
              ? Image.asset('assets/eye-on.png')
              : Image.asset('assets/eye-off.png'),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      validator: widget.onFuncValid,
    );
  }
}

class ContactsFieldWidget extends StatefulWidget {
  ContactsFieldWidget({
    super.key,
    required this.data,
    required this.prefix,
    required this.controller,
    required this.onFuncValid,
  });
  String data;
  String prefix;
  TextEditingController controller;
  final String? Function(String?) onFuncValid;

  @override
  State<ContactsFieldWidget> createState() => _ContactsFieldWidgetState();
}

class _ContactsFieldWidgetState extends State<ContactsFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.prefix,
          style: textHintField,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.data,
              hintStyle: textHintField,
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            controller: widget.controller,
            validator: widget.onFuncValid,
          ),
        ),
      ],
    );
  }
}

class DropdownButtonGenderWidget extends StatefulWidget {
  final Function(String?) onChanged;

  const DropdownButtonGenderWidget({super.key, required this.onChanged});

  @override
  State<DropdownButtonGenderWidget> createState() =>
      _DropdownButtonGenderWidgetState();
}

class _DropdownButtonGenderWidgetState
    extends State<DropdownButtonGenderWidget> {
  String? dropDownValue;
  var items = ['Мужской', 'Женский'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
        isDense: true,
        dropdownColor: Colors.white,
        hint: Text(
          'Выберите пол',
          style: textHintField,
        ),
        borderRadius: BorderRadius.circular(16),
        isExpanded: true,
        value: dropDownValue,
        iconSize: 18,
        icon: Image.asset('assets/Icon.png'),
        style: textHintField,
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
          widget.onChanged(newValue);
        },
        items: items.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Color(0xFF101828)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DateBirthFieldWidget extends StatefulWidget {
  DateBirthFieldWidget(
      {super.key, required this.data, required this.onDateChanged});
  String data;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<DateBirthFieldWidget> createState() => _DateBirthFieldWidgetState();
}

class _DateBirthFieldWidgetState extends State<DateBirthFieldWidget> {
  DateTime initialDate = DateTime(2006);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.data,
          style: textHintField,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 54, top: 7, right: 16, bottom: 7),
            child: DateTimePickerWidget(
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  initialDate = newDate;
                });
                widget.onDateChanged(newDate);
              },
            ),
          ),
        ),
      ],
    );
  }
}
