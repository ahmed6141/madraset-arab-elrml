
import 'package:flutter/material.dart';

void main() {
  runApp(ArabElRmlSchoolApp());
}

class ArabElRmlSchoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مدرسة عرب الرمل الحديثة',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مدرسة عرب الرمل الحديثة')),
      body: Center(
        child: ElevatedButton(
          child: Text('عرض النتيجة'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResultPage()));
          },
        ),
      ),
    );
  }
}

class SearchResultPage extends StatefulWidget {
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final TextEditingController _controller = TextEditingController();
  String? result;

  void _showResult() {
    setState(() {
      result = '''
      الاسم: أحمد محمد
      الصف: الصف الثالث الإعدادي
      المجموع: ٢٧٥ / ٣٠٠
      رابط النتيجة: https://arab-elrml-school.com/results/${_controller.text}
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('البحث عن النتيجة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'أدخل رقم الجلوس'),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showResult,
              child: Text('عرض النتيجة'),
            ),
            SizedBox(height: 20),
            if (result != null) Text(result!, textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }
}
