bool compareDate(DateTime timestamp1, DateTime timestamp2) {
  final date1 = DateTime(timestamp1.year, timestamp1.month, timestamp1.day);
  final date2 = DateTime(timestamp2.year, timestamp2.month, timestamp2.day);
  return date1.isAfter(date2);
}