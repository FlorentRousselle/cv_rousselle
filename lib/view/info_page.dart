import 'package:cv_flutter/ThemeData.dart';
import 'package:cv_flutter/service/ThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      child: GestureDetector(
        child: const Text("swap theme"),
        onTap: () => themeNotifier.swapTheme(),
      ),
    );
  }
}
