import 'package:flamingo/flamingo.dart';

import '../entities/cat.dart';
import '../others/application.dart';

class CatRepository {
  // list of all the cats
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAll() {
    return firestoreInstance.collection(Cat().collectionPath).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getHisCat() {
    return Application.catHolder != null
        ? firestoreInstance
            .collection(Application.catHolder!.cats!.ref.path)
            .snapshots()
        : null;
  }

  // check if the corresponding cat belongs to the catHolder
  static Future<bool> isHisCat(Cat cat) async {
    List<Cat> cats = await CollectionPaging<Cat>(
      query: Application.catHolder!.cats!.ref
          .orderBy('createdAt', descending: true),
      decode: (snap) => Cat(snapshot: snap),
    ).load();
    return cats.where((e) => e.id == cat.id).isNotEmpty;
  }
}
