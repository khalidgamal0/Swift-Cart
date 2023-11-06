import 'package:flutter/material.dart';

void navigatorPush(Widget pageName,context){
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return pageName;
  }));
}