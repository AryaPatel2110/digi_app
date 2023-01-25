
import 'package:final_code/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final bool isPasswordType;
  final String? prefixIcon;
  final FocusNode? nextFocusNode;
  final FocusNode currentFocusNode;
  final bool isLastFocus;
  final bool isReadOnly;
  final num maxLength;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  const InputBox({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    required this.inputType,
    this.isPasswordType = false,
    this.prefixIcon,
    this.nextFocusNode,
    required this.currentFocusNode,
    this.isLastFocus = false,
    this.isReadOnly = false,
    this.maxLength = 50,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: textEditingController,
        maxLines: inputType == TextInputType.multiline ? 4 : 1,
        textAlignVertical: TextAlignVertical.top,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: (prefixIcon != null)
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    prefixIcon!,
                  ),
                )
              : null,
          prefixIconConstraints: (prefixIcon != null)
              ? BoxConstraints.tight(
                  const Size(45, 45),
                )
              : null,

          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primary, width: 2)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
          contentPadding: const EdgeInsets.all(15),
          //fillColor: Colors.grey,
          filled: false,
          labelText: labelText,

          labelStyle:TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w600),
          errorStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.red,
              ),
          counter: const Offstage(),
          alignLabelWithHint: true,
        ),
        obscureText: isPasswordType ? true : false,
        maxLength: maxLength.toInt(),
        enableSuggestions: false,
        cursorColor: AppTheme.primary,
        autovalidateMode: AutovalidateMode.disabled,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: inputType,
        focusNode: currentFocusNode,
        onFieldSubmitted: (term) {
          currentFocusNode.unfocus();
          if (!isLastFocus && nextFocusNode != null)
            FocusScope.of(context).requestFocus(nextFocusNode);
        },
        textInputAction: isLastFocus && inputType != TextInputType.multiline
            ? TextInputAction.done
            : isLastFocus && inputType == TextInputType.multiline
                ? TextInputAction.unspecified
                : TextInputAction.next,
        readOnly: isReadOnly,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
