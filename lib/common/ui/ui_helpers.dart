import 'package:flutter/material.dart';

// --- vertical spacing ---
SizedBox xxsHeightSpan = SizedBox(height: dimen_2);
SizedBox xsHeightSpan = SizedBox(height: dimen_4);
SizedBox sHeightSpan = SizedBox(height: dimen_10);
SizedBox mHeightSpan = SizedBox(height: dimen_16);
SizedBox lHeightSpan = SizedBox(height: dimen_24);
SizedBox llHeightSpan = SizedBox(height: dimen_30);
SizedBox xlHeightSpan = SizedBox(height: dimen_48);
SizedBox xxlHeightSpan = SizedBox(height: dimen_58);

// --- horizontal spacing ---
SizedBox xsWidthSpan = SizedBox(width: dimen_4);
SizedBox sWidthSpan = SizedBox(width: dimen_10);
SizedBox mWidthSpan = SizedBox(width: dimen_16);
SizedBox lWidthSpan = SizedBox(width: dimen_24);
SizedBox xlWidthSpan = SizedBox(width: dimen_48);

// --- page paddings ----
EdgeInsets sPagePadding = EdgeInsets.all(dimen_16);
EdgeInsets sXPagePadding = EdgeInsets.symmetric(horizontal: dimen_16);
EdgeInsets sYPagePadding = EdgeInsets.symmetric(vertical: dimen_16);
EdgeInsets mPagePadding =
    EdgeInsets.symmetric(horizontal: dimen_24, vertical: dimen_16);
EdgeInsets mXPagePadding = EdgeInsets.symmetric(horizontal: dimen_32);
EdgeInsets mYPagePadding = EdgeInsets.symmetric(vertical: dimen_32);
EdgeInsets lPagePadding = EdgeInsets.symmetric(horizontal: dimen_64);

// container padding
EdgeInsets sPadding =
    EdgeInsets.symmetric(horizontal: dimen_8, vertical: dimen_8);
EdgeInsets sXPadding = EdgeInsets.symmetric(horizontal: dimen_8);
EdgeInsets sYPadding = EdgeInsets.symmetric(vertical: dimen_8);
EdgeInsets mPadding =
    EdgeInsets.symmetric(horizontal: dimen_12, vertical: dimen_12);
EdgeInsets mXPadding = EdgeInsets.symmetric(horizontal: dimen_12);
EdgeInsets mYPadding = EdgeInsets.symmetric(vertical: dimen_12);
EdgeInsets lPadding =
    EdgeInsets.symmetric(horizontal: dimen_18, vertical: dimen_18);
EdgeInsets lXPadding = EdgeInsets.symmetric(horizontal: dimen_18);
EdgeInsets lYPadding = EdgeInsets.symmetric(vertical: dimen_18);
EdgeInsets xlPadding =
    EdgeInsets.symmetric(horizontal: dimen_24, vertical: dimen_18);
EdgeInsets xlXPadding = EdgeInsets.symmetric(horizontal: dimen_24);
EdgeInsets xlYPadding = EdgeInsets.symmetric(vertical: dimen_24);
const double dimen_0 = 0;
const double dimen_1 = 1;
const double dimen_2 = 2;
const double dimen_4 = 4;
const double dimen_6 = 6;
const double dimen_8 = 8;
const double dimen_10 = 10;
const double dimen_12 = 12;
const double dimen_14 = 14;
const double dimen_16 = 16;
const double dimen_18 = 18;
const double dimen_20 = 20;
const double dimen_24 = 24;
const double dimen_30 = 30;
const double dimen_32 = 32;
const double dimen_40 = 40;
const double dimen_48 = 48;
const double dimen_58 = 58;
const double dimen_64 = 64;
const double dimen_80 = 80;
const double dimen_100 = 100;
const double dimen_110 = 110;
const double dimen_140 = 140;
const double dimen_150 = 150;
const double dimen_200 = 200;
const double dimen_230 = 230;
const double dimen_300 = 300;
List<BoxShadow> getBoxShadow(BuildContext context, {Color color}) {
  return [
    if (Theme.of(context).brightness == Brightness.light)
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: dimen_20,
        color: (color ?? Theme.of(context).primaryColor).withOpacity(0.37),
      )
    else
      BoxShadow(
        blurRadius: dimen_4,
        color: (color ?? Theme.of(context).primaryColor).withOpacity(0.6),
      ),
  ];
}
