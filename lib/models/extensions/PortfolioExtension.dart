import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/extensions/PortfolioPositionExtension.dart';

extension PortfolioExtension on Portfolio {
  Map<String, dynamic> toJson() {
    Map<String, dynamic> _portfolioJson = {
      'positions': this.positions.map((p) => p.toJson()).toList(),
    };

    return _portfolioJson;
  }
}
