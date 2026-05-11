import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

String? thousandSeparator(double? number) {
  // a function that separates thousands with dots
  if (number == null) return null;
  final formatter = NumberFormat('#,###.##');
  return formatter.format(number).replaceAll(',', '.');
}

List<dynamic> stringListToJson(List<ModelsStruct> models) {
  return models.map((model) {
    return {
      "name": model.name,
      "filename": model.url,
      "price": model.price,
      "promoPrice": model.promoPrice
    };
  }).toList();
}

String? getImageURL(
  List<ImagesRecord> list,
  String type,
) {
  for (final document in list ?? []) {
    if (document.type == type) {
      return document.url;
    }
  }
  return type;
}

List<BankStruct> filterBanksList(
  List<BankStruct> banksList,
  List<CustomPaymentTermsRecord>? banksToBeExcluded,
) {
  // given banksList and banksToBeExcluded lists exclude from banksList the elements which its "name" property appears in banksToBeExcluded in the property "bank"
// Create a set of bank names to be excluded for faster lookup
  final excludedBankNames =
      banksToBeExcluded?.map((bank) => bank.bank).toSet() ?? {};

  // Filter the banksList to exclude banks that are in the excludedBankNames set
  return banksList
      .where((bank) => !excludedBankNames.contains(bank.name))
      .toList();
}
