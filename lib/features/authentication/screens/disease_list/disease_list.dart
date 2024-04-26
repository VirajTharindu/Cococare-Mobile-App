import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// Define a class to represent each disease item
class DiseaseItem {
  final String imageName;
  final String diseaseName;

  const DiseaseItem({required this.imageName, required this.diseaseName});
}

class DiseaseList extends StatelessWidget {
  const DiseaseList({Key? key}) : super(key: key);

  // Define a const list of disease items
  static const List<DiseaseItem> diseaseItems = [
    DiseaseItem(imageName: 'cci.jpeg', diseaseName: 'CCI'),
    DiseaseItem(imageName: 'br.jpg', diseaseName: 'Bud Rot'),
    DiseaseItem(imageName: 'lr.jpg', diseaseName: 'Leaf Rot'),
    DiseaseItem(imageName: 'gls.jpeg', diseaseName: 'Grey Leaf'),
    DiseaseItem(imageName: 'sb_list.jpg', diseaseName: 'Stem Bleeding'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: Text("Disease List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: diseaseItems.length,
              itemBuilder: (context, index) {
                final item = diseaseItems[index];
                return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // Navigate to the respective disease screen based on the disease name
                          switch (item.diseaseName) {
                            case 'CCI':
                              Navigator.pushNamed(context, '/cci');
                              break;
                            case 'Bud Rot':
                              Navigator.pushNamed(context, '/bud_rot');
                              break;
                            case 'Leaf Rot':
                              Navigator.pushNamed(context, '/leaf_rot');
                              break;
                            case 'Grey Leaf':
                              Navigator.pushNamed(context, '/grey_leaf');
                              break;
                            case 'Stem Bleeding':
                              Navigator.pushNamed(context, '/stem_bleeding');
                              break;
                            default:
                              break;
                          }
                        },
                        splashColor: CColors.primaryColor,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CColors.grey.withOpacity(0.7),

                            border: Border.all(
                                color: Colors.grey
                                    .withOpacity(0.7)), // Border color
                            borderRadius: BorderRadius.circular(20.0),
                            // Border radius
                          ),
                          child: ListTile(
                            tileColor: Colors.transparent,
                            // Set tile color
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 22.0,
                            ),
                            leading: Image.asset(
                              'assets/images/${item.imageName}',
                              width: 220,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item.diseaseName),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
