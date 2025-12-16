String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return 'User Name is required';
  }

  if (value.length < 3) {
    return 'User Name must be at least 3 characters long';
  }

  return null;
}



String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }

  return null;
}