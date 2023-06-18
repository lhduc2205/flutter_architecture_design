import 'dart:async';

import 'package:architecture_designed/bootstrap.dart';
import 'package:architecture_designed/service_locator.dart' as sl;
import 'package:flutter/material.dart';

import 'app/view/app.dart';

void main() async {
  sl.initDependencies();
  unawaited(bootstrap());
}
