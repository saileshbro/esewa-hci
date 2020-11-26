import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  final Widget icon;
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
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: getBoxShadow(context, opacity: 0.25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: sPadding.add(sXPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    icon,
                    sWidthSpan,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
