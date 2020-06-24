import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputTextFieldStyle = InputDecoration(
  icon: Icon(
    Icons.location_city,
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0) ),
  ),
  hintText: 'Enter the Country',
  hintStyle: TextStyle(
    color: Colors.brown,


  )
);
