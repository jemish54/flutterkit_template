class Validation<T> {
  final String? Function(String fieldName, T value) validator;

  Validation({required this.validator});
}

class Validator<T> {
  final String fieldName;
  final List<Validation<T>> validations;

  Validator({required this.fieldName, required this.validations});

  String? build(T value) {
    for (final validation in validations) {
      final error = validation.validator(fieldName, value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}

abstract class Validations {
  static Validation<String?> required({String? error}) => Validation<String?>(
        validator: (fieldName, value) {
          if (value == null || value.trim().isEmpty) {
            return error ?? 'Please enter $fieldName';
          }
          return null;
        },
      );

  static Validation<String?> length({
    num? min,
    num? max,
    String? minError,
    String? maxError,
  }) =>
      Validation<String?>(
        validator: (fieldName, value) {
          if (value == null) {
            return 'Null Value';
          }
          if (min != null) {
            if (value.trim().length < min) {
              return minError ?? 'Minimum length of $fieldName should be $min';
            }
          }
          if (max != null) {
            if (value.trim().length > max) {
              return maxError ?? 'Maximum length of $fieldName should be $max';
            }
          }
          return null;
        },
      );

  static Validation<String?> regex(String regex, [String? error]) =>
      Validation<String?>(
        validator: (fieldName, value) {
          if (value == null) {
            return 'Null Value';
          }
          if (!RegExp(regex).hasMatch(value)) {
            return error ?? '$fieldName is Invalid';
          }
          return null;
        },
      );
}

abstract class Validators {
  static String? email(String? value) => Validator<String?>(
        fieldName: 'Email',
        validations: [
          Validations.required(error: 'Email is Required'),
          Validations.regex(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              'Please enter valid email'),
        ],
      ).build(value);

  static String? mobileNumber(String? value) => Validator<String?>(
        fieldName: 'Mobile Number',
        validations: [
          Validations.required(error: 'Mobile Number is required'),
          Validations.regex(r"^[0-9]{10}$", 'Enter a valid mobile number'),
        ],
      ).build(value);

  static String? password(String? value) => Validator<String?>(
        fieldName: 'Password',
        validations: [
          Validations.required(error: 'Password is required'),
          Validations.length(
            min: 8,
            minError: 'Password must be at least 8 characters',
          ),
        ],
      ).build(value);
}
