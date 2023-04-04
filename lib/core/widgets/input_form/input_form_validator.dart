typedef InputValidator<T> = String? Function(T? value);

const String errorTextIsRequired = "Ce champs est obligatoire !";
const String errorSecretCodeNoMatch = "Les deux codes ne correspondent pas !";

class InputFormValidators {
  static InputValidator<T> compose<T>(List<InputValidator<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  static InputValidator<T> required<T>({
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.trim().isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? errorTextIsRequired;
      }
      return null;
    };
  }

  static InputValidator<T> equal<T>(
    Object value, {
    String? errorText,
  }) =>
      (valueCandidate) =>
          valueCandidate != value ? errorText ?? errorSecretCodeNoMatch : null;
}
