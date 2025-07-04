class Input {
  final String label;
  final String? placeholder;
  final String? value;
  final bool isRequired;
  final bool isDisabled;
  final bool isReadonly;
  final String? errorMessage;

  Input({
    required this.label,
    this.placeholder,
    this.value,
    this.isRequired = false,
    this.isDisabled = false,
    this.isReadonly = false,
    this.errorMessage,
  });

  @override
  String toString() {
    return 'Input(label: $label, placeholder: $placeholder, value: $value, isRequired: $isRequired, isDisabled: $isDisabled, isReadonly: $isReadonly, errorMessage: $errorMessage)';
  }
}