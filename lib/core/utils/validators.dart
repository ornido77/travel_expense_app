String? validateEmail(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Email is required.';
  }

  final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  if (!emailPattern.hasMatch(text)) {
    return 'Enter a valid email address.';
  }

  return null;
}

String? validatePassword(String? value) {
  final text = value ?? '';

  if (text.isEmpty) {
    return 'Password is required.';
  }

  if (text.length < 6) {
    return 'Password must be at least 6 characters.';
  }

  return null;
}

String? validateAmount(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Amount is required.';
  }

  final amount = double.tryParse(text);

  if (amount == null) {
    return 'Enter a valid amount.';
  }

  if (amount <= 0) {
    return 'Amount must be greater than zero.';
  }

  return null;
}

String? validateNote(String? value) {
  if ((value ?? '').length > 500) {
    return 'Note must be 500 characters or less.';
  }

  return null;
}
