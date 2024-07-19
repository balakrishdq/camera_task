import 'package:flutter/material.dart';

import 'functions.dart';

extension DoubleExtensions on double {
  Widget get hGap => SizedBox(height: this);
  Widget get wGap => SizedBox(width: this);
  bool get isNotNull => !isNullOrBlank(this);
}