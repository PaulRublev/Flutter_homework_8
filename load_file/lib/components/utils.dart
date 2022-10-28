import 'package:flutter/material.dart';

InputBorder makeCustomInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}
