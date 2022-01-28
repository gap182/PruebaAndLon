import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool isEmailValid = false;
  bool isNameValid = false;
  bool isLastNameValid = false;
  bool isPhoneValid = false;
  bool isIdValid = false;
  bool isCodeValid = true;
  bool isEmailWriting = false;
  bool isNameWriting = false;
  bool isLastNameWriting = false;
  bool isPhoneWrigint = false;
  bool isIdWriting = false;
  bool isCodeWriting = false;

  bool acceptTerms = false;
  bool acceptPrivacy = false;
  bool acceptManual = false;

  bool isValid = false;

  void validation(String text, String type) {
    if (type == "email") {
      validateEmail(text);

      if (text.isNotEmpty) {
        isEmailWriting = true;
      } else {
        isEmailWriting = false;
      }
    }

    if (type == "name") {
      validateName(text);
    }

    if (type == "last") {
      validateLast(text);
    }

    if (type == "phone") {
      validatePhone(text);
    }

    if (type == "id") {
      validateId(text);
    }

    if (type == "code") {
      validateCode(text);
    }

    update();
  }

  bool isWriting(String value) {
    return value.isNotEmpty;
  }

  void validateEmail(String email) {
    isEmailValid = EmailValidator.validate(email);
  }

  void validateName(String name) {
    if (name.length > 3) {
      isNameValid = true;
    } else {
      isNameValid = false;
    }
  }

  void validateLast(String last) {
    if (last.length > 3) {
      isLastNameValid = true;
    } else {
      isLastNameValid = false;
    }
    isLastNameValid = last.length > 3;
  }

  void validatePhone(String phone) {
    if (double.tryParse(phone) != null && phone.length == 10) {
      isPhoneValid = true;
    } else {
      isPhoneValid = false;
    }
  }

  void validateId(String id) {
    if (double.tryParse(id) != null && id.length == 10) {
      isIdValid = true;
    } else {
      isIdValid = false;
    }
  }

  void validateCode(String code) {
    if (double.tryParse(code) != null) {
      isCodeValid = true;
    } else {
      isCodeValid = false;
    }
  }

  void changeAcceptTerms() {
    acceptTerms = !acceptTerms;
    update();
  }

  void changePrivacyTerms() {
    acceptPrivacy = !acceptPrivacy;
    update();
  }

  void changeManualTerms() {
    acceptManual = !acceptManual;
    update();
  }

  void buttonFunction(BuildContext context) {
    if (isEmailValid &&
        isNameValid &&
        isLastNameValid &&
        isIdValid &&
        isPhoneValid &&
        isCodeValid &&
        acceptManual &&
        acceptTerms &&
        acceptPrivacy) {
      print("Ok");
    } else {
      SnackBar snackBar = const SnackBar(content: Text("Revisa los datos"));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
