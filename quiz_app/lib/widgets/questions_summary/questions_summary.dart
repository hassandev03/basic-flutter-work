import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;

  const QuestionsSummary(this.summary, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
