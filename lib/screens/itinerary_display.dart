import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';

class Itinerary extends StatefulWidget {
  Itinerary({super.key});
  @override
  _Itinerary createState() => _Itinerary();
}

class _Itinerary extends State<Itinerary> {
  List<dynamic> _itinerary = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/files/data.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      _itinerary = jsonResponse['itinerary'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppTopNavBar(
          title: Text('Itinerary for the Trip'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: const Color.fromRGBO(40, 90, 132, 1),
              expandedHeight: 66,
              title: Container(
                constraints: const BoxConstraints.expand(
                    width: double.infinity, height: 66),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Varanasi Trip - 3 Days',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Thu, Nov 14 - Sat, Nov 16, 2024',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverList.builder(
                itemCount: _itinerary.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(231, 231, 231, 1)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 5),
                              child: Text('Day ${_itinerary[index]['day']}'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Best Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text(
                                      'Place to visit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '${_itinerary[index]['best_time_to_visit']}',
                                    ),
                                    const SizedBox(width: 25),
                                    const Icon(
                                      Icons.route,
                                      color: Color.fromRGBO(255, 116, 73, 1),
                                    ),
                                    const SizedBox(width: 25),
                                    Text('${_itinerary[index]['name']}')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
