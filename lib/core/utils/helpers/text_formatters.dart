import 'package:intl/intl.dart';

String thousandFormatter(var number) {
  final formatter = NumberFormat("#,###");
  return formatter.format(number);
}
