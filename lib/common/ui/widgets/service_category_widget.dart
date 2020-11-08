import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class ServiceCategoryWidget extends StatelessWidget {
  final Function(String category) onCategoryPressed;
  static const allServices = [
    {
      "en": "Popular Services",
      "np": "लोकप्रिय सेवाहरु",
    },
    {
      "en": "Food and Hospitality",
      "np": "खाना र आथित्य",
    },
    {
      "en": "Stock Broker Payment",
      "np": "ब्रोकर भुक्तानी",
    },
    {
      "en": "Scan and Pay",
      "np": "स्क्यान गरी भुक्तान",
    },
    {
      "en": "Movies",
      "np": "चलचित्र",
    },
    {
      "en": "New Services",
      "np": "नयाँ सेवाहरु",
    },
    {
      "en": "Insurance",
      "np": "बिमा",
    },
    {
      "en": "Health",
      "np": "स्वास्थ्य",
    },
    {
      "en": "Utility Bill Payment",
      "np": "बिल भुक्तानी",
    },
    {
      "en": "Antivirus",
      "np": "एन्टी भइरस",
    },
    {
      "en": "Internet Bill",
      "np": "इन्टरनेट बिल",
    },
    {
      "en": "Online Shopping",
      "np": "अनलाईन् खरिदारी",
    },
  ];
  static const colors = [
    Color(0xffD5E8D4),
    Color(0xffFFF4C3),
    Color(0xffA9C4EB),
    Color(0xffF8CECC),
  ];

  const ServiceCategoryWidget({Key key, this.onCategoryPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String locale = AppLocalizations.of(context).locale.languageCode;
    return Container(
      height: ScreenUtil.screenHeight * 0.345,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: dimen_16,
          mainAxisSpacing: dimen_16,
        ),
        children: allServices
            .asMap()
            .entries
            .map((e) => Material(
                  color: colors[e.key % colors.length],
                  child: InkWell(
                    onTap: () => onCategoryPressed(e.value[locale ?? 'en']),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: dimen_18,
                        left: dimen_18,
                        right: dimen_8,
                        bottom: dimen_8,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(e.value[locale ?? 'en'],
                            maxLines: 2,
                            maxFontSize: Theme.of(context)
                                .textTheme
                                .headline6
                                .fontSize
                                .ceilToDouble(),
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
