class CustomDuration extends Duration {
  CustomDuration({
    super.days = 0,
    super.hours = 0,
    super.minutes = 0,
    super.seconds = 0,
    super.milliseconds = 0,
    super.microseconds = 0,
  });

  static final CustomDuration low = CustomDuration(milliseconds: 350);
  static final CustomDuration low2 = CustomDuration(milliseconds: 500);
  static final CustomDuration normal = CustomDuration(seconds: 1);
  static final CustomDuration normal2 = CustomDuration(seconds: 2);
  static final CustomDuration long = CustomDuration(seconds: 4);
  static final CustomDuration long2 = CustomDuration(seconds: 5);
}
