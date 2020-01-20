import 'package:flutter/material.dart';

Future push(context, page){
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pop(context, dynamic obj){
  Navigator.pop(context, obj);
}