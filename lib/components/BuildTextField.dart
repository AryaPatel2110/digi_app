
import 'package:final_code/theme/app_theme.dart';
import 'package:final_code/theme/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BuildTextField extends StatefulWidget {
  final String label;
  final String hinttext;
  final double width;
  Function? callback;
   BuildTextField({Key? key, required this.label, required this.hinttext, required this.width, this.callback}) : super(key: key);

  @override
  State<BuildTextField> createState() => _BuildTextFieldState(callback);
}

class _BuildTextFieldState extends State<BuildTextField> {
  Function? callback;
  _BuildTextFieldState(this.callback);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var selectedelememt;

    return Container(
      height: getProportionateScreenWidth(55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.label,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: getProportionateScreenHeight(widget.width),
            height: getProportionateScreenHeight(35),
            child: TextFormField(
              cursorColor: AppTheme.primary,
              //obscureText: true,
              onSaved: (newValue) => {
                setState(() {
                  selectedelememt = newValue;
                  callback!(newValue);
                })
              },

              onChanged: (value) {
                if (value.isNotEmpty) {
                  //removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  // removeError(error: kShortPassError);
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  //addError(error: kPassNullError);
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                //border: InputBorder.none,
                //labelText: "Password",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary, width: 2)),
                hintText: widget.hinttext,
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
