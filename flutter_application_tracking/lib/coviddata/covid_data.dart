import 'dart:convert';

class CovidData {
  String? activeCasesText;
  String? countryText;
  String? lastUpdate;
  String? newCasesText;
  String? newDeathsText;
  String? totalCasesText;
  String? totalDeathsText;
  String? totalRecoveredText;

  CovidData({
    this.activeCasesText,
    this.countryText,
    this.lastUpdate,
    this.newCasesText,
    this.newDeathsText,
    this.totalCasesText,
    this.totalDeathsText,
    this.totalRecoveredText,
  });

  @override
  String toString() {
    return 'CovidData(activeCasesText: $activeCasesText, countryText: $countryText, lastUpdate: $lastUpdate, newCasesText: $newCasesText, newDeathsText: $newDeathsText, totalCasesText: $totalCasesText, totalDeathsText: $totalDeathsText, totalRecoveredText: $totalRecoveredText)';
  }

  factory CovidData.fromMap(Map<String, dynamic> data) => CovidData(
        activeCasesText: data['Active Cases_text'] as String?,
        countryText: data['Country_text'] as String?,
        lastUpdate: data['Last Update'] as String?,
        newCasesText: data['New Cases_text'] as String?,
        newDeathsText: data['New Deaths_text'] as String?,
        totalCasesText: data['Total Cases_text'] as String?,
        totalDeathsText: data['Total Deaths_text'] as String?,
        totalRecoveredText: data['Total Recovered_text'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Active Cases_text': activeCasesText,
        'Country_text': countryText,
        'Last Update': lastUpdate,
        'New Cases_text': newCasesText,
        'New Deaths_text': newDeathsText,
        'Total Cases_text': totalCasesText,
        'Total Deaths_text': totalDeathsText,
        'Total Recovered_text': totalRecoveredText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CovidData].
  factory CovidData.fromJson(String data) {
    return CovidData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CovidData] to a JSON string.
  String toJson() => json.encode(toMap());
}
