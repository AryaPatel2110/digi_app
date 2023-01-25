import 'package:sprintf/sprintf.dart';

class Validators {
  Validators._();

  static String? validateValue(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  static String? validateFriendsName(String? value) {
    if (value == null) {
      return 'Please enter friend(s) name';
    }
    List<String> multipleNames = value.split(",");
    if (value.trim().isEmpty) {
      return 'Please enter friend(s) name';
    } else if (multipleNames.isNotEmpty) {
      RegExp regExp = RegExp(r'^[A-Z][a-zA-Z]$');
      var error = "";
      for (var name in multipleNames) {
        if (name.trim().isEmpty) {
          error = 'Friend Name is empty';
        } else if (regExp.hasMatch(name)) {
          error = sprintf('Friend Name is invalid: %s', [name]);
        }
      }
      if (error.isEmpty) {
        return null;
      } else {
        return error;
      }
    }
    return null;
  }

  static String? validateFriendsEmail(String? value) {
    List<String> multipleEmails = value?.split(",") ?? [];
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (value?.trim().isEmpty == true) {
      return 'Please enter friend(s) email';
    } else if (multipleEmails.isNotEmpty) {
      var error = "";
      for (var email in multipleEmails) {
        if (email.trim().isEmpty) {
          error = 'Friend Email is empty';
        } else if (!regExp.hasMatch(email)) {
          error = sprintf('Friend Email is invalid: %s', [email]);
        }
      }
      if (error.isEmpty) {
        return null;
      } else {
        return error;
      }
    }
    return null;
  }

  static String? validateEmail(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null || !regex.hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? validateConfirmEmail(String? value, String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null || !regex.hasMatch(value)) {
      return "Please enter valid email";
    } else if (value != email) {
      return "Email does not match";
    }
    return null;
  }

  static String? validateUrl(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value != null) {
      if (value.trim().isNotEmpty && !regex.hasMatch(value)) {
        return "Please enter valid website url";
      }
    }
    return null;
  }
}
