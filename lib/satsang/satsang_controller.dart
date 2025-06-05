import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SatsangController extends GetxController {
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  RxBool? popularStatus = false.obs;
  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      log("date is --->${selectedDate.value}");
    }
  }
}