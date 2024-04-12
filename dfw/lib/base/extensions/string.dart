extension StringExtension on String {
  String toCapitalise() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
