import 'package:esewa_hci/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class RequiredFieldsBanner extends StatelessWidget {
  final String requiredField;

  const RequiredFieldsBanner(
      {Key key, this.requiredField = TranslationStrings.required})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Text(
            "*",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 8),
          child: Text(
            requiredField.t(context),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
