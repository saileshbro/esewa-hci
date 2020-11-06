import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool password;
  final TextInputType textInputType;
  final int lines;
  final String label;
  final bool autoFocus;
  final bool enabled;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final String Function(String) validator;
  final Function(String) onChanged;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextCapitalization textCapitalization;
  final bool required;
  const DTextField({
    this.controller,
    this.password = false,
    this.textInputType = TextInputType.text,
    this.lines = 1,
    this.enabled = true,
    this.focusNode,
    this.onEditingComplete,
    this.validator,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.label,
    this.autoFocus = false,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      locale: Locale('en'),
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(label,
                          style: Theme.of(context).textTheme.subtitle1),
                    )
                  : SizedBox.shrink(),
              required
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                      child: Text(
                        "*",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          TextFormField(
            focusNode: focusNode,
            autofocus: autoFocus,
            onEditingComplete: onEditingComplete,
            validator: validator,
            onChanged: onChanged,
            controller: controller,
            style: Theme.of(context).textTheme.subtitle1,
            obscureText: password,
            keyboardType: textInputType,
            enabled: enabled,
            maxLines: lines,
            minLines: lines,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.subtitle1.apply(
                    color: Theme.of(context).disabledColor,
                  ),
              prefixIcon: prefixIcon,
              hintText: hintText,
              enabled: enabled,
              suffixIcon: suffixIcon,
              errorStyle: Theme.of(context).textTheme.subtitle1.apply(
                    color: Theme.of(context).errorColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
