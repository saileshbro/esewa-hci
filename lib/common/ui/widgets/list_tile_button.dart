import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool hasArrow;
  final Function onPressed;

  const ListTileButton({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    @required this.onPressed,
    this.hasArrow = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: sPadding.add(sXPadding),
        decoration: BoxDecoration(
          boxShadow: getBoxShadow(context),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: dimen_34.w,
              color: Theme.of(context).primaryColor,
            ),
            sWidthSpan,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                  ),
                  xsHeightSpan,
                  AutoSizeText(
                    subtitle,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle2,
                    maxFontSize: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .fontSize
                        .ceilToDouble(),
                  ),
                ],
              ),
            ),
            if (hasArrow) ...[
              sWidthSpan,
              Icon(
                Icons.arrow_forward_ios,
                size: dimen_30,
                color: Theme.of(context).primaryColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
