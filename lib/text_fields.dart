import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleFormField extends StatefulWidget {
  SimpleFormField({super.key, required this.data, this.maxLinesField = 1});
  String data;
  final maxLinesField;

  @override
  State<SimpleFormField> createState() => _SimpleFormFieldState();
}

class _SimpleFormFieldState extends State<SimpleFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLinesField,
      decoration: InputDecoration(
        hintText: widget.data,
        hintStyle: TextStyle(
          color: Color(0xFF667085),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter data';
        }
        return null;
      },
    );
  }
}

class FieldSwitch extends StatefulWidget {
  FieldSwitch(
      {super.key,
      required this.hintText,
      required this.data,
      required this.pathIcon});
  List<String> data;
  String pathIcon;
  String hintText;

  @override
  _FieldSwitchState createState() => _FieldSwitchState();
}

class _FieldSwitchState extends State<FieldSwitch> {
  final TextEditingController _controller = TextEditingController();
  int _currentIndex = 0;

  void _toggleStrings() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.data.length;
      _controller.text = widget.data[_currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xFF667085),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        suffixIcon: IconButton(
          icon: Image.asset(widget.pathIcon),
          onPressed: _toggleStrings,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter data';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }
}

class PasswordField extends StatefulWidget {
  PasswordField({super.key, required this.data});
  String data;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.data,
        hintStyle: TextStyle(
          color: Color(0xFF667085),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        suffixIcon: IconButton(
          icon: _isObscure
              ? Image.asset('assets/eye-off.png')
              : Image.asset('assets/eye-on.png'),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter data';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }
}

class FieldsContact extends StatefulWidget {
  const FieldsContact({super.key, required this.data, required this.prefix});
  final String data;
  final String prefix;

  @override
  State<FieldsContact> createState() => _FieldsContactState();
}

class _FieldsContactState extends State<FieldsContact> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.prefix + widget.data,
        hintStyle: TextStyle(
          color: Color(0xFF667085),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter data';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }
}

class DateField extends StatefulWidget {
  const DateField({super.key, required this.data});
  final String data;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите дату',
        hintStyle: TextStyle(
          color: Color(0xFF667085),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter data';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }
}
