import 'package:flutter/material.dart';
import 'package:flutter_navigator/models/guide.dart';
import 'package:flutter_navigator/services/api.dart';

class GuideDetailScreen extends StatefulWidget {
  final int id;
  const GuideDetailScreen({Key key, this.id}) : super(key: key);

  @override
  _GuideDetailScreenState createState() => _GuideDetailScreenState();
}

class _GuideDetailScreenState extends State<GuideDetailScreen> {
  Guide guide;
  @override
  void initState() {
    super.initState();
    (() async {
      Guide fetchGuide = await getEpisode(widget.id);
      setState(() {
        guide = fetchGuide;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        guide == null
            ? Container()
            : SizedBox(
                height: 320,
                child: Image.network(
                  guide.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
        guide == null
            ? CircularProgressIndicator()
            : Text(
                guide.title,
                style: TextStyle(fontSize: 60),
              ),
      ],
    );
  }
}
