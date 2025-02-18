bool arePhoneNumbersEqual(String phoneNumber1, String phoneNumber2) {
  if (phoneNumber1.isEmpty ||
      phoneNumber2.isEmpty ||
      phoneNumber1.length < 10 ||
      phoneNumber2.length < 10) {
    return false;
  }
  // Extract the last 10 characters
  String last10Digits1 = phoneNumber1.substring(phoneNumber1.length - 10);
  String last10Digits2 = phoneNumber2.substring(phoneNumber2.length - 10);

  // Compare the last 10 digits
  return last10Digits1 == last10Digits2;
}
