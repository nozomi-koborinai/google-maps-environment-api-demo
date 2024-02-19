/// AirQuality API のレスポンス
/// https://developers.google.com/maps/documentation/air-quality/reference/rest/v1/currentConditions/lookup?hl=ja&_gl=1*1q64m0v*_up*MQ..*_ga*NzE0NDk4NjI4LjE3MDgwNjA0NTE.*_ga_NRWSTWS78N*MTcwODA4OTgyMy4zLjAuMTcwODA4OTgyMy4wLjAuMA..#response-body
class AirQuality {
  final String dateTime;
  final String regionCode;
  final List<AirQualityIndex> indexes;
  final List<Pollutant> pollutants;
  final HealthRecommendations healthRecommendations;

  AirQuality({
    required this.dateTime,
    required this.regionCode,
    required this.indexes,
    required this.pollutants,
    required this.healthRecommendations,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      dateTime: json['dateTime'] ?? '',
      regionCode: json['regionCode'] ?? '',
      indexes: json['indexes'] != null
          ? List<AirQualityIndex>.from(
              json['indexes'].map((x) => AirQualityIndex.fromJson(x)))
          : [],
      pollutants: json['pollutants'] != null
          ? List<Pollutant>.from(
              json['pollutants'].map((x) => Pollutant.fromJson(x)))
          : [],
      healthRecommendations:
          HealthRecommendations.fromJson(json['healthRecommendations'] ?? {}),
    );
  }
}

class AirQualityIndex {
  final String code;
  final String displayName;
  final String aqiDisplay;
  final Map<String, dynamic> color;
  final String category;
  final String dominantPollutant;
  final int aqi;

  AirQualityIndex({
    required this.code,
    required this.displayName,
    required this.aqiDisplay,
    required this.color,
    required this.category,
    required this.dominantPollutant,
    required this.aqi,
  });

  factory AirQualityIndex.fromJson(Map<String, dynamic> json) {
    return AirQualityIndex(
      code: json['code'] ?? '',
      displayName: json['displayName'] ?? '',
      aqiDisplay: json['aqiDisplay'] ?? '',
      color: json['color'] ?? {},
      category: json['category'] ?? '',
      dominantPollutant: json['dominantPollutant'] ?? '',
      aqi: json['aqi'] ?? 0,
    );
  }
}

class Pollutant {
  final String code;
  final String displayName;
  final String fullName;
  final Concentration concentration;
  final AdditionalInfo additionalInfo;

  Pollutant({
    required this.code,
    required this.displayName,
    required this.fullName,
    required this.concentration,
    required this.additionalInfo,
  });

  factory Pollutant.fromJson(Map<String, dynamic> json) {
    return Pollutant(
      code: json['code'] ?? '',
      displayName: json['displayName'] ?? '',
      fullName: json['fullName'] ?? '',
      concentration: Concentration.fromJson(json['concentration'] ?? {}),
      additionalInfo: AdditionalInfo.fromJson(json['additionalInfo'] ?? {}),
    );
  }
}

class Concentration {
  final String units;
  final double value;

  Concentration({
    required this.units,
    required this.value,
  });

  factory Concentration.fromJson(Map<String, dynamic> json) {
    return Concentration(
      units: json['units'] ?? '',
      value: json['value'] ?? 0.0,
    );
  }
}

class AdditionalInfo {
  final String sources;
  final String effects;

  AdditionalInfo({
    required this.sources,
    required this.effects,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      sources: json['sources'] ?? '',
      effects: json['effects'] ?? '',
    );
  }
}

class HealthRecommendations {
  final String generalPopulation;
  final String elderly;
  final String lungDiseasePopulation;
  final String heartDiseasePopulation;
  final String athletes;
  final String pregnantWomen;
  final String children;

  HealthRecommendations({
    required this.generalPopulation,
    required this.elderly,
    required this.lungDiseasePopulation,
    required this.heartDiseasePopulation,
    required this.athletes,
    required this.pregnantWomen,
    required this.children,
  });

  factory HealthRecommendations.fromJson(Map<String, dynamic> json) {
    return HealthRecommendations(
      generalPopulation: json['generalPopulation'] ?? '',
      elderly: json['elderly'] ?? '',
      lungDiseasePopulation: json['lungDiseasePopulation'] ?? '',
      heartDiseasePopulation: json['heartDiseasePopulation'] ?? '',
      athletes: json['athletes'] ?? '',
      pregnantWomen: json['pregnantWomen'] ?? '',
      children: json['children'] ?? '',
    );
  }
}
