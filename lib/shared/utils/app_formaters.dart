import 'package:intl/intl.dart';

String formatHour(DateTime now) {
  return DateFormat('kk:mm').format(now);
}
