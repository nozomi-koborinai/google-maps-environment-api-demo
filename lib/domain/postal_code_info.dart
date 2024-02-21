/// Firebase Extensions の PaLM API によって返却される想定のデータ構造
class PostalCodeInfo {
  final String postalCode;
  final String area;
  final Address address;
  final RealEstate realEstate;
  final RentalPrices rentalPrices;
  final String crimeRate;
  final String atmosphere;
  final Demographics demographics;
  final String naturalDisasters;
  final DisasterPrevention disasterPrevention;

  PostalCodeInfo({
    required this.postalCode,
    required this.area,
    required this.address,
    required this.realEstate,
    required this.rentalPrices,
    required this.crimeRate,
    required this.atmosphere,
    required this.demographics,
    required this.naturalDisasters,
    required this.disasterPrevention,
  });

  factory PostalCodeInfo.fromJson(Map<String, dynamic> json) {
    return PostalCodeInfo(
      postalCode: json['postal_code'] ?? '',
      area: json['area'] ?? '',
      address: Address.fromJson(json['address'] as Map<String, dynamic>? ?? {}),
      realEstate: RealEstate.fromJson(
          json['real_estate'] as Map<String, dynamic>? ?? {}),
      rentalPrices: RentalPrices.fromJson(
          json['rental_prices'] as Map<String, dynamic>? ?? {}),
      crimeRate: json['crime_rate'] ?? '',
      atmosphere: json['atmosphere'] ?? '',
      demographics: Demographics.fromJson(
          json['demographics'] as Map<String, dynamic>? ?? {}),
      naturalDisasters: json['natural_disasters'] ?? '',
      disasterPrevention: DisasterPrevention.fromJson(
          json['disaster_prevention'] as Map<String, dynamic>? ?? {}),
    );
  }
}

class Address {
  final String street;
  final double lat;
  final double lng;

  Address({
    required this.street,
    required this.lat,
    required this.lng,
  });

  factory Address.fromJson(Map<String, dynamic>? json) {
    return Address(
      street: json?['street'] as String? ?? '',
      lat: (json?['lat'] as num?)?.toDouble() ?? -1.0,
      lng: (json?['lng'] as num?)?.toDouble() ?? -1.0,
    );
  }
}

class RealEstate {
  final int medianPrice;
  final String range;

  RealEstate({
    required this.medianPrice,
    required this.range,
  });

  factory RealEstate.fromJson(Map<String, dynamic>? json) {
    return RealEstate(
      medianPrice: json?['median_price'] as int? ?? -1,
      range: json?['range'] as String? ?? '',
    );
  }
}

class RentalPrices {
  final String aptAverage;

  RentalPrices({
    required this.aptAverage,
  });

  factory RentalPrices.fromJson(Map<String, dynamic>? json) {
    return RentalPrices(
      aptAverage: json?['1k_apt_average'] as String? ?? '',
    );
  }
}

class Demographics {
  final String ageGroup;

  Demographics({
    required this.ageGroup,
  });

  factory Demographics.fromJson(Map<String, dynamic>? json) {
    return Demographics(
      ageGroup: json?['age_group'] as String? ?? '',
    );
  }
}

class DisasterPrevention {
  final String geotechnicalInfo;

  DisasterPrevention({
    required this.geotechnicalInfo,
  });

  factory DisasterPrevention.fromJson(Map<String, dynamic>? json) {
    return DisasterPrevention(
      geotechnicalInfo: json?['geotechnical_info'] as String? ?? '',
    );
  }
}
