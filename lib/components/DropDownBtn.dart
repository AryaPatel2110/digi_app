import 'dart:convert';

import 'package:final_code/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class DropDownBtn extends StatefulWidget {
  final double height;
  final double width;
  final String name;
  late final List element;
  Function? callback;
  DropDownBtn({Key? key, required this.element, required this.name, this.callback, required this.height, required this.width }) : super(key: key);
  @override
  _DropDownBtnState createState() => _DropDownBtnState(callback);
}

class _DropDownBtnState extends State<DropDownBtn> {
  Function? callback;
  _DropDownBtnState(this.callback);

  // Initial Selected Value
  var selectedelememt;

  //Api Code for copy it's proper position in class where DropDownBtn called

//  String url = 'http://cleanions.bestweb.my/api/location/get_state';
//   Future getstate() async {
//     try {
//       var responce = await http.get(Uri.parse(url));
//       if (responce.statusCode == 200) {
//         var data = json.decode(responce.body);
//
// //      print(data);
//         setState(() {
//           widget.element = data['state'];
//         });
//       }
//       else {
//         print("api fetching error");
//       }
//     }
//     catch(e)
//     {
//       print(e);
//     }
//   }
//   @override
//   void initState() {
//     //getstate();
//     // _getStateList();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: getProportionateScreenWidth(widget.width),
      height: getProportionateScreenWidth(widget.height),
      decoration: BoxDecoration(
          color:Colors.white, //background color of dropdown button
          borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
          boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 9,
              offset: Offset(0.0, 2),
            ), //blur radius of shadow
          ]
      ),

      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 8.0,right: 8),
                child: DropdownButton<String>(
                  value: selectedelememt,
                  iconSize: 30,
                  underline: Container(),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                  elevation:60,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  hint: Align(
                            alignment: Alignment(0, 0),
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                //fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  onChanged: (newValue) {
                    setState(() {
                      selectedelememt = newValue;
                      callback!(newValue);
                    });
                  },
                  items: widget.element.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item!['lable'].toString()),
                      value: item!['lable'].toString(),
                    );
                  }).toList() ?? [],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
              ),
            ],
          )
        ],
      ),
    );
  }
}




