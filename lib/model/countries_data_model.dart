class CountryData {
  final int updated;
  final String country;
  final CountryInfo countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final String continent;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CountryData({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      updated: json['updated'] ?? 0,
      country: json['country'] ?? '',
      countryInfo: CountryInfo.fromJson(json['countryInfo']),
      cases: json['cases'] ?? 0,
      todayCases: json['todayCases'] ?? 0,
      deaths: json['deaths'] ?? 0,
      todayDeaths: json['todayDeaths'] ?? 0,
      recovered: json['recovered'] ?? 0,
      todayRecovered: json['todayRecovered'] ?? 0,
      active: json['active'] ?? 0,
      critical: json['critical'] ?? 0,
      casesPerOneMillion: json['casesPerOneMillion'] ?? 0,
      deathsPerOneMillion: json['deathsPerOneMillion'] ?? 0,
      tests: json['tests'], // already nullable (int?)
      testsPerOneMillion: json['testsPerOneMillion'] ?? 0,
      population: json['population'] ?? 0,
      continent: json['continent'] ?? '',
      oneCasePerPeople: json['oneCasePerPeople'] ?? 0,
      oneDeathPerPeople: json['oneDeathPerPeople'] ?? 0,
      oneTestPerPeople: json['oneTestPerPeople'] ?? 0,
      activePerOneMillion:
          (json['activePerOneMillion'] as num?)?.toDouble() ?? 0.0,
      recoveredPerOneMillion:
          (json['recoveredPerOneMillion'] as num?)?.toDouble() ?? 0.0,
      criticalPerOneMillion:
          (json['criticalPerOneMillion'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class CountryInfo {
  final int id;
  final String iso2;
  final String iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo({
    required this.id,
    required this.iso2,
    required this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'] ?? 0,
      iso2: json['iso2'] ?? '',
      iso3: json['iso3'] ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      long: (json['long'] as num?)?.toDouble() ?? 0.0,
      flag: json['flag'],
    );
  }
}
