import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    this.labelText = 'Phone Number',
    this.enableInteractiveSelection = true,
    this.isCountrySelectionEnabled = true,
    this.phoneController,
    required this.onChanged,
    super.key,
  });

  final String labelText;
  final bool isCountrySelectionEnabled;
  final bool enableInteractiveSelection;
  final void Function({
    required String complete,
    required String code,
  }) onChanged;
  final PhoneController? phoneController;

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: phoneController,
      /*isCountrySelectionEnabled: isCountrySelectionEnabled,
      enableInteractiveSelection: enableInteractiveSelection,*/
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: const TextStyle(
          color: Colors.red
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      validator: PhoneValidator.compose([
        // list of validators to use
        // PhoneValidator.required(context, errorText: "Number required"),
        PhoneValidator.validMobile(context),
        // ..
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (phone) {
        // ignore: unnecessary_null_comparison
        if (phone == null) return;

        String complete = phone.nsn;
        String code = phone.international;
        onChanged(code: code, complete: complete);
      },
    );
  }
}

///Drop Down Menu with button
///Not searchable
class DropDownMenuButton<T> extends StatelessWidget {
  DropDownMenuButton({
    this.hint,
    this.initialSelection,
    required this.isEquals,
    this.width = double.infinity,
    required this.onSelect,
    this.options = const [],
    required this.label,
    super.key,
  });

  final String? hint;
  final T? initialSelection;
  final void Function(T) onSelect;
  final String Function(T) label;
  final List<T> options;
  final double width;
  final bool Function(T listItem, T? item) isEquals;
  late final ValueNotifier<T?> _valueNotifier = ValueNotifier(
      options.where((e) => isEquals(e, initialSelection)).firstOrNull);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, value, _) {
        return Card(
          // color: Colors.white,
          elevation: 12.0,
          shadowColor: Colors.grey.withOpacity(0.15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          // margin: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: width,
            // height: height,
            child: DropdownButton<T>(
              isExpanded: true,
              hint: Text(
                hint ?? "e.g ${options.isEmpty ? '' : label(options.first)}",
              ),
              value: value,
              alignment: Alignment.center,
              //style: itemStyle,
              //underline: itemUnderline,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              //focusColor: HexColor("#A9D2F0"),
              // dropdownColor: Colors.white,
              elevation: 12,
              onChanged: (newValue) {
                if (newValue != null) {
                  onSelect(newValue);
                  _valueNotifier.value = newValue;
                }
              },
              items: options
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e,
                      child: Center(
                        child: Text(
                          label(e),
                          textAlign: TextAlign.center,
                          //style: itemStyle,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class OnHover extends StatelessWidget {
  OnHover({
    required this.builder,
    this.animationDuration = const Duration(milliseconds: 100),
    super.key,
  });

  final Widget Function(bool isHovered) builder;
  final Duration animationDuration;
  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        child: ValueListenableBuilder(
          valueListenable: isHovered,
          builder: (__, bool hovered, ___) => builder.call(hovered),
        ),
      ),
    );
  }
}
