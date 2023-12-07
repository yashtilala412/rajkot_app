import 'package:flutter/material.dart';
import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:fire_flutter_app_test/utils/data.dart';
// import '../services/api_call.dart';
import '../widgets/recommend_item.dart';

class FilterHotelScreen extends StatefulWidget {
  @override
  _FilterHotelScreenState createState() => _FilterHotelScreenState();
}

class _FilterHotelScreenState extends State<FilterHotelScreen> {
  double _minBudget = 100;
  double _maxBudget = 1000;
  double _increment = 10;

  RangeValues _budgetRange = RangeValues(100, 1000);
  Map<String, bool> _filters = {
    '5 Star': false,
    '4 Star': false,
    '3 Star': false,
    '2 Star': false,
    '1 Star': false,
    'Unrated': false,
  };

  @override
  Widget build(BuildContext context) {
    _budgetRange = RangeValues(
      (_budgetRange.start / _increment).round() * _increment,
      (_budgetRange.end / _increment).round() * _increment,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters', style: TextStyle(color: AppColor.labelColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Budget Range',
              style: TextStyle(fontSize: 18, color: AppColor.labelColor),
            ),
            RangeSlider(
              values: _budgetRange,
              min: _minBudget,
              max: _maxBudget,
              divisions: ((_maxBudget - _minBudget) / _increment).round(),
              onChanged: (RangeValues values) {
                setState(() {
                  _budgetRange = values;
                  _budgetRange = RangeValues(
                    (_budgetRange.start / _increment).round() * _increment,
                    (_budgetRange.end / _increment).round() * _increment,
                  );
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${_budgetRange.start.toInt()}',
                    style: TextStyle(fontSize: 16, color: AppColor.labelColor),
                  ),
                  Text(
                    '\$${_budgetRange.end.toInt()}',
                    style: TextStyle(fontSize: 16, color: AppColor.labelColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Filters',
              style: TextStyle(fontSize: 18, color: AppColor.labelColor),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1, // Adjust the flex value here for filter options
                  child: Column(
                    children: _filters.keys.map((String filter) {
                      return CheckboxListTile(
                        title: Text(filter,
                            style: TextStyle(color: AppColor.labelColor)),
                        value: _filters[filter],
                        onChanged: (bool? value) {
                          
                          setState(() {
                            _filters[filter] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  flex:
                      2, // Adjust the flex value here for recommendation items
                  child: _getRecommend(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRecommend() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }
}
