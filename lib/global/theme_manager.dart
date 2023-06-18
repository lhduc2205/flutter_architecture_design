import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeManager extends Cubit<ThemeData> {
  ThemeManager() : super(ThemeData.light());
}