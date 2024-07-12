import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'text_fields.dart';
import 'headers_text.dart';
import 'auto_button.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();
  bool isButtonActive = true;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            HeadersText(data: 'ОСНОВНАЯ ИНФОРМАЦИЯ'),
            FieldsBackground(widgets: [
              SimpleFormField(data: 'Ваше имя*'),
              VerticalDivider(),
              SimpleFormField(data: 'Ваша фамилия'),
              VerticalDivider(),
              FieldSwitch(
                data: ['Мужской', 'Женский'],
                hintText: 'Выберите пол',
                pathIcon: 'assets/Icon.png',
              ),
              VerticalDivider(),
              DateField(data: 'Дата рождения*'),
            ]),
            HeadersText(data: 'КОНТАКТНАЯ ИНФОРМАЦИЯ'),
            FieldsBackground(widgets: [
              FieldsContact(
                prefix: '+7 ',
                data: 'ваш номер телефона',
              ),
              VerticalDivider(),
              FieldsContact(
                prefix: '@ ',
                data: 'имя пользоватлея в Telegram',
              )
            ]),
            HeadersText(data: 'О СЕБЕ'),
            FieldsBackground(widgets: [
              SimpleFormField(
                data:
                    'Расскажите о себе подробнее...\n(например, футболист, 24 года)',
                maxLinesField: 4,
              ),
            ]),
            HeadersText(data: 'ГДЕ ВЫ НАХОДИТЕСЬ'),
            FieldsBackground(widgets: [
              SimpleFormField(data: 'Ваша страна*'),
              VerticalDivider(),
              SimpleFormField(data: 'Ваш регион*'),
              VerticalDivider(),
              SimpleFormField(data: 'Ваш населенный пункт*'),
            ]),
            HeadersText(data: 'ДАННЫЕ ДЛЯ ВХОДА'),
            FieldsBackground(widgets: [
              SimpleFormField(data: 'Ваша электронная почта*'),
              VerticalDivider(),
              PasswordField(data: 'Придумайте пароль*'),
              VerticalDivider(),
              PasswordField(data: 'Повторите пароль*')
            ]),
            SizedBox(
              height: 24,
            ),
            AutoButton(
              backgroundColor:
                  isButtonActive ? Color(0xFFEC4A0A) : Color(0xFFFAD4C4),
              fontColor: Color(0xFFFFFFFF),
              data: 'Зарегистрироваться',
              onFunc: () {
                isButtonActive
                    ? () {
                        setState(() {
                          isButtonActive = false;
                        });
                      }
                    : null;
              },
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Container(
        width: double.infinity,
        color: Color(0xFFEAECF0),
        height: 1.0,
      ),
    );
  }
}

class FieldsBackground extends StatelessWidget {
  FieldsBackground({super.key, required this.widgets});
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
