
import 'package:final_code/theme/app_theme.dart';
import 'package:final_code/theme/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextBtn extends StatefulWidget {
  final String label;
  final String hinttext;
  final double width;

  Function? callback;
  TextBtn({Key? key, required this.label, required this.hinttext, required this.width, this.callback}) : super(key: key);

  @override
  State<TextBtn> createState() => _TextBtnState(callback);
}

class _TextBtnState extends State<TextBtn> {

  FocusNode _focusNode = FocusNode();
  bool textEditHasFocus = false;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        textEditHasFocus = _focusNode.hasFocus;
      });
    });
  }
  Function? callback;
  _TextBtnState(this.callback);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var selectedelememt;

    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(

            widget.label,
            style: TextStyle(

                fontSize: 13,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10,),
          child: SizedBox(

            width: getProportionateScreenHeight(widget.width),
            height: getProportionateScreenHeight(35),
            child: TextFormField(

              style: TextStyle(
                fontSize: 14,
              ),
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
               // labelText: widget.label,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary, width: 2)),
                hintText: widget.hinttext,

                hintStyle: TextStyle(

                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never,

              ),

            ),

          ),
        ),
      ],
    );

  }
}
