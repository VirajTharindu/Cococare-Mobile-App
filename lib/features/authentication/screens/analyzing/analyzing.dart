import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/data/repositories/tracking/tracking_repository.dart';
import 'package:coconut_disease_detection/features/authentication/models/tracking_model.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Analyzing extends StatefulWidget {
  const Analyzing({Key? key}) : super(key: key);

  @override
  _AnalyzingState createState() => _AnalyzingState();
}

class _AnalyzingState extends State<Analyzing> {
  final TrackingRepository _trackingRepository =
      TrackingRepository.instance; // Instance
  List<TrackingDataModel> _trackingData = []; // List to store fetched data
  List<FlSpot> _spreadRatingsData = [];

  double? firstSpreadRating = 0.0;
  double? lastSpreadRating = 0.0;

  late Timer _timer = Timer(const Duration(seconds: 0), () {});

  @override
  void initState() {
    super.initState();
    _fetchTrackingData();
    _fetchSpreadRatingValues();

    // Start a timer to fetch spread ratings periodically
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _fetchSpreadRatingValues();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  Future<void> _fetchTrackingData() async {
    try {
      List<TrackingDataModel> trackingData =
          await _trackingRepository.fetchTrackingData();
      setState(() {
        _trackingData = trackingData;
        _prepareChartData(); // Prepare chart data after fetching tracking data
      });

      // Fetch spread rating values after tracking data is fetched
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching tracking data: $e');
      }
      // Handle errors appropriately (consider showing a snackbar or error message)
    }
  }

  void _prepareChartData() {
    if (_trackingData.isEmpty) {
      if (kDebugMode) {
        print('No tracking data available for charting');
      }
      return; // Handle empty data scenario (show a message or skip charting)
    }

    // Sort the tracking data based on the DateTime values
    _trackingData.sort((a, b) => a.id.compareTo(b.id));

    // Create FlSpot data with DateTime values on x-axis and diseaseSpreadRate on y-axis
    _spreadRatingsData = _trackingData.asMap().entries.map((entry) {
      final index = entry.key;
      final tracking = entry.value;
      return FlSpot(index.toDouble(), tracking.diseaseSpreadRate);
    }).toList();
  }

  Future<void> _fetchSpreadRatingValues() async {
    try {
      if (kDebugMode) {
        print('Fetching spread rating values...');
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Tracking')
          .orderBy('diseaseSpreadRate', descending: false)
          .get();

      if (kDebugMode) {
        print('Fetched ${querySnapshot.docs.length} spread rating documents');
      }

      if (querySnapshot.docs.isNotEmpty) {
        // Ensure at least 2 documents exist
        final lastSpreadRate =
            querySnapshot.docs[1]['diseaseSpreadRate'] as double?;
        final firstSpreadRate =
            querySnapshot.docs.last['diseaseSpreadRate'] as double?;

        if (kDebugMode) {
          print('First Spread Rate: $firstSpreadRate');
          print('last Spread Rate: $lastSpreadRate');
        }

        final status = _calculateStatus(firstSpreadRate, lastSpreadRate);
        setState(() {
          // Update state with retrieved data and calculated status
          firstSpreadRating = firstSpreadRate;
          lastSpreadRating = lastSpreadRate;
        });
      } else {
        // Handle case where less than 2 documents exist (optional)
        if (kDebugMode) {
          print('empty fetching of data');
        }
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Error fetching data: ${e.code} - ${e.message}');
      }
    }
  }

  String _calculateStatus(double? firstSpreadRate, double? secondSpreadRate) {
    if (firstSpreadRate == null || secondSpreadRate == null) {
      return 'Null';
    } else if (secondSpreadRate > firstSpreadRate) {
      return 'Bad';
    } else if (secondSpreadRate == firstSpreadRate) {
      return 'Same';
    } else {
      return 'Good';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Building widget...');
    }
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Analyzing'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 600,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const Text(
                        'Disease Spread Ratings',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CColors.darkergrey),
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 360,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CColors.lightgrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 28, bottom: 20, left: 28, right: 40),
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                ),
                                titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                      ),
                                    )),
                                borderData: FlBorderData(
                                  show: true,
                                ),
                                minX: 0,
                                maxX: _spreadRatingsData.length.toDouble(),
                                minY: 0,
                                maxY: 6,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _spreadRatingsData,
                                    isCurved: true,
                                    color: CColors.primaryColor,
                                    barWidth: 4,
                                    isStrokeCapRound: true,
                                    belowBarData: BarAreaData(show: false),
                                    dotData: FlDotData(show: true),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: CColors.lightgrey,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text(
                                                    'Initial rate:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    'Current rate:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Status',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${firstSpreadRating ?? ''}    ',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    '${lastSpreadRating ?? ''}',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  Text(
                                                    _calculateStatus(
                                                        firstSpreadRating,
                                                        lastSpreadRating),
                                                    style: TextStyle(
                                                        color: _calculateStatus(
                                                                    firstSpreadRating,
                                                                    lastSpreadRating) ==
                                                                'Bad'
                                                            ? Colors
                                                                .red // Change color to red for 'Bad' status
                                                            : _calculateStatus(
                                                                        firstSpreadRating,
                                                                        lastSpreadRating) ==
                                                                    'Good'
                                                                ? CColors
                                                                    .primaryColor // Change color to green for 'Good' status
                                                                : CColors
                                                                    .darkergrey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
