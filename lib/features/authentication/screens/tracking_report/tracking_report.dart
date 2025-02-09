import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/data/repositories/tracking/tracking_repository.dart';
import 'package:coconut_disease_detection/features/authentication/models/tracking_model.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TrackingReport extends StatelessWidget {
  const TrackingReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text('Tracking Report'),
      ),
      body: FutureBuilder<List<TrackingDataModel>>(
        future: TrackingRepository.instance.fetchTrackingData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<TrackingDataModel> trackingData = snapshot.data ?? [];
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CColors.grey.withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: CColors.grey.withOpacity(0.7),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 60,
                      columnSpacing: 20,
                      dividerThickness: 1.5,
                      columns: const [
                        // Tracking ID column
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Tracking ID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        DataColumn(
                          label: SizedBox(
                            width: 150,
                            child: Text(
                              'Spread',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Spread_Rate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 150,
                            child: Text(
                              'Severity',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Severity_Rate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 150,
                            child: Text(
                              'Effectiveness',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Effect._Rate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 150,
                            child: Text(
                              'Impact_Yield',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Impact._Rate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 150,
                            child: Text(
                              'Env._Resistance',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(
                              'Env._Re._Rate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                      rows: trackingData
                          .map(
                            (data) => DataRow(
                              cells: [
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          data.id,
                                          softWrap: true,
                                        )),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          data.diseasespreadComment,
                                          softWrap: true,
                                        )),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 100, maxHeight: 150),
                                    // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.diseaseSpreadRate.toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.severitySymptomsComment,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 100,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.severitySymptomsRate.toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.controllingMeasuresComment,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 100,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.controllingMeasuresRate.toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          data.impactYieldComment,
                                          softWrap: true,
                                        )),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 100,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.impactYieldRate.toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.environmentalConditionsComment,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 100,
                                        maxHeight:
                                            150), // Adjust the maximum width as needed
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        data.environmentalConditionsRate
                                            .toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
