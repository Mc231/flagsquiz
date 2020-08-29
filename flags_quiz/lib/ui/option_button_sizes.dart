import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'option_button.dart';

extension OptionButtonSizes on OptionButton {
  BorderRadius get borderRadius => BorderRadius.circular(8);

  int get maxLines => 2;

  double getFontSize(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 16, tablet: 24, desktop: 24, watch: 12);
  }
}
