import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';

import 'loading_list_widget.dart';

class ImageDisplayer extends StatefulWidget {
  String? imagePath;
  ImageDisplayer(this.imagePath, {Key? key}) : super(key: key);

  @override
  State<ImageDisplayer> createState() => _ImageDisplayerState();
}

class _ImageDisplayerState extends State<ImageDisplayer> {
  String? src;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.imagePath != null && (widget.imagePath?.isNotEmpty ?? false)) {
        final ref = FirebaseStorage.instance.ref().child(widget.imagePath!);
        ref.getDownloadURL().then((value) {
          setState(() {
            src = value;
          });
        }).catchError((onError) {
          if (onError is FirebaseException &&
              onError.code == "object-not-found") {
            debugPrint(
                "The image couldn't be loaded because it doesn't exist on the server");
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return src == null
        ? const MyShimmerEffectUI.rectangular(
            width: 100,
            height: 100,
          )
        : Image.network(
            src!,
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          );
  }
}
