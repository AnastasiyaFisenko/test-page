import 'package:flutter/material.dart';
import 'form_fileds_widget.dart';
import 'auto_button_widget.dart';
import 'styles.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final _formKey = GlobalKey<FormState>();
  Color buttonColor = Color(0xFFFAD4C4);
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? passwordError;
  String? gender;
  String? genderError;
  String? dateBirth;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePasswords);
    confirmPasswordController.addListener(_validatePasswords);
  }

  void _validatePasswords() {
    setState(() {
      if (passwordController.text != confirmPasswordController.text) {
        passwordError = 'Пароли не совпадают';
      } else {
        passwordError = null;
      }
      _updateButtonColor();
    });
  }

  void _updateButtonColor() {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordError == null && gender != null) {
        setState(() {
          buttonColor = Color(0xFFEC4A0A);
        });
      } else {
        setState(() {
          buttonColor = Color(0xFFFAD4C4);
        });
      }
    } else {
      setState(() {
        buttonColor = Color(0xFFFAD4C4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        onChanged: () {
          _updateButtonColor();
        },
        child: Column(
          children: [
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('ОСНОВНАЯ ИНФОРМАЦИЯ', style: headersStyle),
                )),
            FieldsBackgroundWidget(widgets: [
              SimpleFormFieldWidget(
                data: 'Ваше имя*',
                onFuncValid: (value) {
                  if (value!.isEmpty || value.length > 30) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: nameController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              SimpleFormFieldWidget(
                data: 'Ваша фамилия',
                onFuncValid: (value) {
                  if (value!.isEmpty || value.length > 30) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: surnameController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: DateBirthFieldWidget(
                  data: 'Дата рождения*',
                  onDateChanged: (DateTime newDate) {
                    setState(() {
                      dateBirth = newDate.toString();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DropdownButtonGenderWidget(
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue;
                    });
                  },
                ),
              ),
              if (genderError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    genderError!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ]),
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('КОНТАКТНАЯ ИНФОРМАЦИЯ', style: headersStyle),
                )),
            FieldsBackgroundWidget(widgets: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ContactsFieldWidget(
                  prefix: '+7 ',
                  data: 'ваш номер телефона',
                  onFuncValid: (value) {
                    final phoneRegex = RegExp(r'^\d{10}$');
                    if (value!.isEmpty || !phoneRegex.hasMatch(value)) {
                      return 'Неверно введенные данные';
                    }
                    return null;
                  },
                  controller: phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ContactsFieldWidget(
                  prefix: '@ ',
                  data: 'имя пользователя в Telegram',
                  onFuncValid: (value) {
                    if (value!.isEmpty) {
                      return 'Неверно введенные данные';
                    }
                    return null;
                  },
                  controller: telegramController,
                ),
              )
            ]),
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('О СЕБЕ', style: headersStyle),
                )),
            FieldsBackgroundWidget(widgets: [
              SimpleFormFieldWidget(
                data:
                    'Расскажите о себе подробнее...\n(например, футболист, 24 года)',
                maxLinesField: 4,
                onFuncValid: (value) {
                  return null;
                },
                controller: infoController,
              ),
            ]),
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('ГДЕ ВЫ НАХОДИТЕСЬ', style: headersStyle),
                )),
            FieldsBackgroundWidget(widgets: [
              SimpleFormFieldWidget(
                data: 'Ваша страна*',
                onFuncValid: (value) {
                  if (value!.isEmpty) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: countryController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              SimpleFormFieldWidget(
                data: 'Ваш регион*',
                onFuncValid: (value) {
                  if (value!.isEmpty) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: regionController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              SimpleFormFieldWidget(
                data: 'Ваш населенный пункт*',
                onFuncValid: (value) {
                  if (value!.isEmpty) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: townController,
              ),
            ]),
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('ДАННЫЕ ДЛЯ ВХОДА', style: headersStyle),
                )),
            FieldsBackgroundWidget(widgets: [
              SimpleFormFieldWidget(
                data: 'Ваша электронная почта*',
                onFuncValid: (value) {
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (value!.isEmpty || !emailRegex.hasMatch(value)) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: emailController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              PasswordFieldWidget(
                data: 'Придумайте пароль*',
                controller: passwordController,
                onFuncValid: (value) {
                  if (value!.isEmpty) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: divider,
              ),
              PasswordFieldWidget(
                data: 'Повторите пароль*',
                onFuncValid: (value) {
                  if (value!.isEmpty) {
                    return 'Неверно введенные данные';
                  }
                  return null;
                },
                controller: confirmPasswordController,
              ),
            ]),
            if (passwordError != null)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  passwordError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(
              height: 24,
            ),
            AutoButtonWidget(
              backgroundColor: buttonColor,
              fontColor: Color(0xFFFFFFFF),
              data: 'Зарегистрироваться',
              onFunc: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    setState(() {
                      passwordError = 'Пароли не совпадают';
                    });
                  } else {
                    setState(() {
                      buttonColor = Color(0xFFEC4A0A);
                    });
                    debugPrint('Name: ${nameController.text}');
                    debugPrint('Surname: ${surnameController.text}');
                    debugPrint('Date of Birth: $dateBirth');
                    debugPrint('Phone: ${phoneController.text}');
                    debugPrint('Telegram: ${telegramController.text}');
                    debugPrint('Info: ${infoController.text}');
                    debugPrint('Country: ${countryController.text}');
                    debugPrint('Region: ${regionController.text}');
                    debugPrint('Town: ${townController.text}');
                    debugPrint('Email: ${emailController.text}');
                    debugPrint('Password: ${passwordController.text}');
                    debugPrint('Gender: $gender');
                  }
                }
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class FieldsBackgroundWidget extends StatelessWidget {
  FieldsBackgroundWidget({super.key, required this.widgets});
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: widgets,
        ));
  }
}
