import 'dart:math';

import 'package:flutter/material.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class DDropDownMenu extends StatefulWidget {
  final String label;
  final bool enabled;
  final String placeHolder;
  final Function(String) onSelected;
  final List<String> items;
  final bool isRequired;

  const DDropDownMenu({
    Key key,
    @required this.items,
    @required this.label,
    @required this.placeHolder,
    @required this.onSelected,
    this.isRequired = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  _DDropDownMenuState createState() => _DDropDownMenuState();
}

class _DDropDownMenuState extends State<DDropDownMenu> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      locale: Locale('en'),
      context: context,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.label != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(widget.label,
                          style: Theme.of(context).textTheme.bodyText2),
                    )
                  : SizedBox.shrink(),
              widget.isRequired
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                      child: Text(
                        "*",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          PopupMenuButton<String>(
            enabled: widget.enabled,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.placeHolder,
                    style: Theme.of(context).textTheme.bodyText2.apply(
                          color:
                              isSelected ? null : Theme.of(context).hintColor,
                        ),
                  ),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: Icon(Icons.arrow_back_ios),
                  )
                ],
              ),
            ),
            onSelected: (val) {
              isSelected = true;
              widget.onSelected(val);
            },
            itemBuilder: (_) {
              return widget.items.map((e) {
                return PopupMenuItem(
                  value: e,
                  child: Container(
                    width: double.maxFinite,
                    child: Text(e.t(context),
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
