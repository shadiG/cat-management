import 'package:cat_management/data/entities/cat_holder.dart';
import 'package:flamingo/flamingo.dart';

class CatHolderFactory {
  static Future createCatHolders() async {
    //since we have a lot of data to commit, let's use batch then
    // Batch
    final batch = Batch();
    List<CatHolder> catHolders = [
      CatHolder()
        ..age = 22
        ..name = 'Bob Lee'
        ..avatar = 'cat-holder/user-1.jpeg',
      CatHolder()
        ..age = 46
        ..name = 'Christian'
        ..avatar = 'cat-holder/user-2.jpeg',
      CatHolder()
        ..age = 32
        ..name = 'Esperanza'
        ..avatar = 'cat-holder/user-3.jpeg',
      CatHolder()
        ..age = 16
        ..name = 'Allan Fletcher'
        ..avatar = 'cat-holder/user-4.jpeg',
      CatHolder()
        ..age = 35
        ..name = 'Dorothe Sanchez'
        ..avatar = 'cat-holder/user-5.jpeg',
      CatHolder()
        ..age = 26
        ..name = 'Suzie Leslie'
        ..avatar = 'cat-holder/user-6.jpeg',
    ];

    for (CatHolder catHolder in catHolders) {
      batch.save(catHolder);
    }

    //let's commit our change then

    await batch.commit();
  }
}
