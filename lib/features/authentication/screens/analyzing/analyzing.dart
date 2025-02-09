import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/data/repositories/tracking/tracking_repository.dart';
import 'package:coconut_disease_detection/features/authentication/models/tracking_model.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
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
  List<FlSpot> _severityRatingsData = [];
  List<FlSpot> _effectivenessRatingsData = [];
  List<FlSpot> _impactYieldRatingsData = [];
  List<FlSpot> _environmentalResistanceRatingsData = [];

  double? firstSpreadRating = 0.0;
  double? lastSpreadRating = 0.0;

  double? firstSeverityRating = 0.0;
  double? lastSeverityRating = 0.0;

  double? firstEffectivenessRating = 0.0;
  double? lastEffectivenessRating = 0.0;

  double? firstImpactonYieldRating = 0.0;
  double? lastImpactonYieldRating = 0.0;

  double? firstEnvironmentalResistanceRating = 0.0;
  double? lastEnvironmentalResistanceRating = 0.0;

  @override
  late Timer _timer = Timer(const Duration(seconds: 0), () {});

  @override
  void initState() {
    super.initState();
    _fetchTrackingData();
    _fetchSpreadRatingValues();
    _fetchTrackingData2();
    _fetchSeverityRatingValues();
    _fetchTrackingData3();
    _fetchEffectivenessRatingValues();
    _fetchTrackingData4();
    _fetchImpactYieldRatingValues();
    _fetchTrackingData5();
    _fetchEnvironmentalResistanceRatingValues();

    // Start a timer to fetch spread ratings periodically
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _fetchSpreadRatingValues();
      _fetchSeverityRatingValues();
      _fetchEffectivenessRatingValues();
      _fetchImpactYieldRatingValues();
      _fetchEnvironmentalResistanceRatingValues();
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

  Future<void> _fetchTrackingData2() async {
    try {
      List<TrackingDataModel> trackingData =
          await _trackingRepository.fetchTrackingData();
      setState(() {
        _trackingData = trackingData;
        _prepareChartData2(); // Prepare chart data after fetching tracking data
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching tracking data: $e');
      }
      // Handle errors appropriately (consider showing a snackbar or error message)
    }
  }

  void _prepareChartData2() {
    if (_trackingData.isEmpty) {
      if (kDebugMode) {
        print('No tracking data available for charting');
      }
      return; // Handle empty data scenario (show a message or skip charting)
    }

    // Sort the tracking data based on the DateTime values
    _trackingData.sort((a, b) => a.id.compareTo(b.id));

    // Create FlSpot data with DateTime values on x-axis and diseaseSpreadRate on y-axis
    _severityRatingsData = _trackingData.asMap().entries.map((entry) {
      final index = entry.key;
      final tracking = entry.value;
      return FlSpot(index.toDouble(), tracking.severitySymptomsRate);
    }).toList();
  }

  Future<void> _fetchSeverityRatingValues() async {
    try {
      if (kDebugMode) {
        print('Fetching severity rating values...');
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Tracking')
          .orderBy('severitySymptomsRate', descending: false)
          .get();

      if (kDebugMode) {
        print('Fetched ${querySnapshot.docs.length} severity rating documents');
      }

      if (querySnapshot.docs.isNotEmpty) {
        // Ensure at least 2 documents exist
        final lastSeverityRate =
            querySnapshot.docs[1]['severitySymptomsRate'] as double?;
        final firstSeverityRate =
            querySnapshot.docs.last['severitySymptomsRate'] as double?;

        if (kDebugMode) {
          print('First Severity Rate: $firstSeverityRate');
          print('last Severity Rate: $lastSeverityRate');
        }

        final status = _calculateStatus2(firstSeverityRate, lastSeverityRate);
        setState(() {
          // Update state with retrieved data and calculated status
          firstSeverityRating = firstSeverityRate;
          lastSeverityRating = lastSeverityRate;
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

  String _calculateStatus2(
      double? firstSeverityRate, double? secondSeverityRate) {
    if (firstSeverityRate == null || secondSeverityRate == null) {
      return 'Null';
    } else if (secondSeverityRate > firstSeverityRate) {
      return 'Bad';
    } else if (secondSeverityRate == firstSeverityRate) {
      return 'Same';
    } else {
      return 'Good';
    }
  }

  Future<void> _fetchTrackingData3() async {
    try {
      List<TrackingDataModel> trackingData =
          await _trackingRepository.fetchTrackingData();
      setState(() {
        _trackingData = trackingData;
        _prepareChartData3(); // Prepare chart data after fetching tracking data
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching tracking data: $e');
      }
      // Handle errors appropriately (consider showing a snackbar or error message)
    }
  }

  void _prepareChartData3() {
    if (_trackingData.isEmpty) {
      if (kDebugMode) {
        print('No tracking data available for charting');
      }
      return; // Handle empty data scenario (show a message or skip charting)
    }

    // Sort the tracking data based on the DateTime values
    _trackingData.sort((a, b) => a.id.compareTo(b.id));

    // Create FlSpot data with DateTime values on x-axis and diseaseSpreadRate on y-axis
    _effectivenessRatingsData = _trackingData.asMap().entries.map((entry) {
      final index = entry.key;
      final tracking = entry.value;
      return FlSpot(index.toDouble(), tracking.controllingMeasuresRate);
    }).toList();
  }

  Future<void> _fetchEffectivenessRatingValues() async {
    try {
      if (kDebugMode) {
        print('Fetching effectiveness rating values...');
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Tracking')
          .orderBy('controllingMeasuresRate', descending: false)
          .get();

      if (kDebugMode) {
        print(
            'Fetched ${querySnapshot.docs.length} effectiveness rating documents');
      }

      if (querySnapshot.docs.isNotEmpty) {
        // Ensure at least 2 documents exist
        final lastEffectivenessRate =
            querySnapshot.docs[1]['controllingMeasuresRate'] as double?;
        final firstEffectivenessRate =
            querySnapshot.docs.last['controllingMeasuresRate'] as double?;

        if (kDebugMode) {
          print('First Effectiveness Rate: $lastEffectivenessRate');
          print('last Effectiveness Rate: $firstEffectivenessRate');
        }

        final status =
            _calculateStatus3(firstEffectivenessRate, lastEffectivenessRate);
        setState(() {
          // Update state with retrieved data and calculated status
          firstEffectivenessRating = firstEffectivenessRate;
          lastEffectivenessRating = lastEffectivenessRate;
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

  String _calculateStatus3(
      double? firstEffectivenessRate, double? secondEffectivenessRate) {
    if (firstEffectivenessRate == null || secondEffectivenessRate == null) {
      return 'Null';
    } else if (secondEffectivenessRate > firstEffectivenessRate) {
      return 'Good';
    } else if (secondEffectivenessRate == firstEffectivenessRate) {
      return 'Same';
    } else {
      return 'Bad';
    }
  }

  Future<void> _fetchTrackingData4() async {
    try {
      List<TrackingDataModel> trackingData =
          await _trackingRepository.fetchTrackingData();
      setState(() {
        _trackingData = trackingData;
        _prepareChartData4(); // Prepare chart data after fetching tracking data
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching tracking data: $e');
      }
      // Handle errors appropriately (consider showing a snackbar or error message)
    }
  }

  void _prepareChartData4() {
    if (_trackingData.isEmpty) {
      if (kDebugMode) {
        print('No tracking data available for charting');
      }
      return; // Handle empty data scenario (show a message or skip charting)
    }

    // Sort the tracking data based on the DateTime values
    _trackingData.sort((a, b) => a.id.compareTo(b.id));

    // Create FlSpot data with DateTime values on x-axis and diseaseSpreadRate on y-axis
    _impactYieldRatingsData = _trackingData.asMap().entries.map((entry) {
      final index = entry.key;
      final tracking = entry.value;
      return FlSpot(index.toDouble(), tracking.impactYieldRate);
    }).toList();
  }

  Future<void> _fetchImpactYieldRatingValues() async {
    try {
      if (kDebugMode) {
        print('Fetching Impact Yield rating values...');
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Tracking')
          .orderBy('impactYieldRate', descending: false)
          .get();

      if (kDebugMode) {
        print(
            'Fetched ${querySnapshot.docs.length} ImpactYield rating documents');
      }

      if (querySnapshot.docs.isNotEmpty) {
        // Ensure at least 2 documents exist
        final lastImpactYieldRate =
            querySnapshot.docs[1]['impactYieldRate'] as double?;
        final firstImpactYieldRate =
            querySnapshot.docs.last['impactYieldRate'] as double?;

        if (kDebugMode) {
          print('First impactYield Rate: $lastImpactYieldRate');
          print('last impactYield Rate: $firstImpactYieldRate');
        }

        final status =
            _calculateStatus4(firstImpactYieldRate, lastImpactYieldRate);
        setState(() {
          // Update state with retrieved data and calculated status
          firstImpactonYieldRating = firstImpactYieldRate;
          lastImpactonYieldRating = lastImpactYieldRate;
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

  String _calculateStatus4(
      double? firstImpactYieldRate, double? secondImpactYieldRate) {
    if (firstImpactYieldRate == null || secondImpactYieldRate == null) {
      return 'Null';
    } else if (secondImpactYieldRate > firstImpactYieldRate) {
      return 'Good';
    } else if (secondImpactYieldRate == firstImpactYieldRate) {
      return 'Same';
    } else {
      return 'Bad';
    }
  }

  Future<void> _fetchTrackingData5() async {
    try {
      List<TrackingDataModel> trackingData =
          await _trackingRepository.fetchTrackingData();
      setState(() {
        _trackingData = trackingData;
        _prepareChartData5(); // Prepare chart data after fetching tracking data
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching tracking data: $e');
      }
      // Handle errors appropriately (consider showing a snackbar or error message)
    }
  }

  void _prepareChartData5() {
    if (_trackingData.isEmpty) {
      if (kDebugMode) {
        print('No tracking data available for charting');
      }
      return; // Handle empty data scenario (show a message or skip charting)
    }

    // Sort the tracking data based on the DateTime values
    _trackingData.sort((a, b) => a.id.compareTo(b.id));

    // Create FlSpot data with DateTime values on x-axis and diseaseSpreadRate on y-axis
    _environmentalResistanceRatingsData =
        _trackingData.asMap().entries.map((entry) {
      final index = entry.key;
      final tracking = entry.value;
      return FlSpot(index.toDouble(), tracking.environmentalConditionsRate);
    }).toList();
  }

  Future<void> _fetchEnvironmentalResistanceRatingValues() async {
    try {
      if (kDebugMode) {
        print('Fetching Environmental Resistance rating values...');
      }

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Tracking')
          .orderBy('environmentalConditionsRate', descending: false)
          .get();

      if (kDebugMode) {
        print(
            'Fetched ${querySnapshot.docs.length} Environmental Resistance rating documents');
      }

      if (querySnapshot.docs.isNotEmpty) {
        // Ensure at least 2 documents exist
        final lastEnvironmentalResistanceRate =
            querySnapshot.docs[1]['environmentalConditionsRate'] as double?;
        final firstEnvironmentalResistanceRate =
            querySnapshot.docs.last['environmentalConditionsRate'] as double?;

        if (kDebugMode) {
          print(
              'First EnvironmentalResistance Rate: $lastEnvironmentalResistanceRate');
          print(
              'last EnvironmentalResistance Rate: $firstEnvironmentalResistanceRate');
        }

        final status = _calculateStatus5(
            firstEnvironmentalResistanceRate, lastEnvironmentalResistanceRate);
        setState(() {
          // Update state with retrieved data and calculated status
          firstEnvironmentalResistanceRating = firstEnvironmentalResistanceRate;
          lastEnvironmentalResistanceRating = lastEnvironmentalResistanceRate;
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

  String _calculateStatus5(double? firstEnvironmentalResistanceRate,
      double? secondEnvironmentalResistanceRate) {
    if (firstEnvironmentalResistanceRate == null ||
        secondEnvironmentalResistanceRate == null) {
      return 'Null';
    } else if (secondEnvironmentalResistanceRate >
        firstEnvironmentalResistanceRate) {
      return 'Good';
    } else if (secondEnvironmentalResistanceRate ==
        firstEnvironmentalResistanceRate) {
      return 'Same';
    } else {
      return 'Bad';
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
                        'Effectiveness Ratings of C.M.',
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
                                maxX:
                                    _effectivenessRatingsData.length.toDouble(),
                                minY: 0,
                                maxY: 6,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _effectivenessRatingsData,
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
                                                    '${firstEffectivenessRating ?? ''}    ',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    '${lastEffectivenessRating ?? ''}',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  Text(
                                                    _calculateStatus3(
                                                        firstEffectivenessRating,
                                                        lastEffectivenessRating),
                                                    style: TextStyle(
                                                        color: _calculateStatus3(
                                                                    firstEffectivenessRating,
                                                                    lastEffectivenessRating) ==
                                                                'Bad'
                                                            ? Colors
                                                                .red // Change color to red for 'Bad' status
                                                            : _calculateStatus3(
                                                                        firstEffectivenessRating,
                                                                        lastEffectivenessRating) ==
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
                        'Severity Ratings',
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
                                maxX: _severityRatingsData.length.toDouble(),
                                minY: 0,
                                maxY: 6,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _severityRatingsData,
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
                                                    '${firstSeverityRating ?? ''}    ',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    '${lastSeverityRating ?? ''}',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  Text(
                                                    _calculateStatus2(
                                                        firstSeverityRating,
                                                        lastSeverityRating),
                                                    style: TextStyle(
                                                        color: _calculateStatus2(
                                                                    firstSeverityRating,
                                                                    lastSeverityRating) ==
                                                                'Bad'
                                                            ? Colors
                                                                .red // Change color to red for 'Bad' status
                                                            : _calculateStatus2(
                                                                        firstSeverityRating,
                                                                        lastSeverityRating) ==
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
                        'Impact on Yield Ratings',
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
                                maxX: _impactYieldRatingsData.length.toDouble(),
                                minY: 0,
                                maxY: 6,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _impactYieldRatingsData,
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
                                                    '${firstImpactonYieldRating ?? ''}    ',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    '${lastImpactonYieldRating ?? ''}',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  Text(
                                                    _calculateStatus4(
                                                        firstImpactonYieldRating,
                                                        lastImpactonYieldRating),
                                                    style: TextStyle(
                                                        color: _calculateStatus4(
                                                                    firstImpactonYieldRating,
                                                                    lastImpactonYieldRating) ==
                                                                'Bad'
                                                            ? Colors
                                                                .red // Change color to red for 'Bad' status
                                                            : _calculateStatus4(
                                                                        firstImpactonYieldRating,
                                                                        lastImpactonYieldRating) ==
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
                        'Environmental Resistance Rate',
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
                                maxX: _environmentalResistanceRatingsData.length
                                    .toDouble(),
                                minY: 0,
                                maxY: 6,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _environmentalResistanceRatingsData,
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
                                                    '${firstEnvironmentalResistanceRating ?? ''}    ',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_forward_outlined),
                                                  Text(
                                                    '${lastEnvironmentalResistanceRating ?? ''}',
                                                    style: const TextStyle(
                                                        color:
                                                            CColors.darkergrey),
                                                  ),
                                                  Text(
                                                    _calculateStatus5(
                                                        firstEnvironmentalResistanceRating,
                                                        lastEnvironmentalResistanceRating),
                                                    style: TextStyle(
                                                        color: _calculateStatus5(
                                                                    firstEnvironmentalResistanceRating,
                                                                    lastEnvironmentalResistanceRating) ==
                                                                'Bad'
                                                            ? Colors
                                                                .red // Change color to red for 'Bad' status
                                                            : _calculateStatus5(
                                                                        firstEnvironmentalResistanceRating,
                                                                        lastEnvironmentalResistanceRating) ==
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
