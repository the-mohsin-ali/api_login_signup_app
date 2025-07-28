// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_login_signup_app/widgets/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.test,
    required this.active,
    required this.critical,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.todayRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.topCenter, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.067),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    ReusableRow(
                        title: 'Cases', value: widget.totalCases.toString()),
                    ReusableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString()),
                    ReusableRow(
                        title: 'Deaths', value: widget.totalDeaths.toString()),
                    ReusableRow(
                        title: 'Critical', value: widget.critical.toString()),
                    ReusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered.toString()),
                    ReusableRow(
                        title: 'Active', value: widget.active.toString()),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image),
            )
          ])
        ],
      ),
    );
  }
}
