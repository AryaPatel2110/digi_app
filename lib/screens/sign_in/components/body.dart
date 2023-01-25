

import 'package:final_code/components/input_box.dart';
import 'package:final_code/components/validator.dart';
import 'package:final_code/services/http_services.dart';
import 'package:final_code/theme/size_config.dart';
import 'package:flutter/material.dart';




class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _grFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();


  final TextEditingController _grController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InputBox(
                        inputType: TextInputType.text,
                        labelText: "Gr No",
                        currentFocusNode: _grFocus,
                        nextFocusNode: _mobileFocus,
                        validator: (value) {
                          return Validators.validateValue(value, "name");
                        },
                        textEditingController: _grController,
                      ),
                      InputBox(
                        inputType: TextInputType.emailAddress,
                        labelText: "Mobile No",
                        currentFocusNode: _mobileFocus,
                        //nextFocusNode: _websiteFocus,
                        validator: (value) {
                          return Validators.validateValue(value, "name");
                        },
                        textEditingController: _mobileController,
                      ),
                      // BuildTextField(label: "Gr number", hinttext: "gr", width: SizeConfig.screenWidth),

                      ElevatedButton(
                        onPressed: () async{
                          if (_formKey.currentState?.validate() == true) {
                            print(_grController.value.text.trim());
                            print(_mobileController.value.text.trim());

                             HttpService.studentLogin("1",_grController.value.text.trim() ,_mobileController.value.text.trim() );

                            // print(student?.isSuccess);
                            // print(student?.message);

                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.1,
                            shadows: [
                              Shadow(
                                blurRadius: 0.1,
                              )
                            ],
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}