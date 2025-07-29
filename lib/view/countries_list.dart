import 'package:api_login_signup_app/model/countries_data_model.dart';
import 'package:api_login_signup_app/services/states_services.dart';
import 'package:api_login_signup_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Countries List'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: const InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(50.0)),
                  hintText: 'Search Country',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder:
                      (context, AsyncSnapshot<List<CountryData>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No Data Found'));
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            // String name = countryData['country'];
                            String name = snapshot.data![index].country;
                            // String name = snapshot.data![index]['country'];

                            CountryData countryData = snapshot.data![index];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    name: name,
                                                    image: countryData
                                                        .countryInfo.flag,
                                                    test: countryData.tests ?? 0,
                                                    active: countryData.active,
                                                    critical:
                                                        countryData.critical ?? 0,
                                                    totalCases:
                                                        countryData.cases ?? 0,
                                                    totalDeaths:
                                                        countryData.deaths,
                                                    totalRecovered:
                                                        countryData.recovered,
                                                    todayRecovered: countryData
                                                        .todayRecovered,
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(countryData.country),
                                      subtitle:
                                          Text(countryData.cases.toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(snapshot
                                              .data![index].countryInfo.flag)),
                                    ),
                                  )
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    name: name,
                                                    image: countryData
                                                        .countryInfo.flag,
                                                    test: countryData.tests ?? 0,
                                                    active: countryData.active,
                                                    critical:
                                                        countryData.critical ?? 0,
                                                    totalCases:
                                                        countryData.cases ?? 0,
                                                    totalDeaths:
                                                        countryData.deaths,
                                                    totalRecovered:
                                                        countryData.recovered,
                                                    todayRecovered: countryData
                                                        .todayRecovered,
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(countryData.country),
                                      subtitle:
                                          Text(countryData.cases.toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              countryData.countryInfo.flag)),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  })),
        ],
      )),
    );
  }
}
