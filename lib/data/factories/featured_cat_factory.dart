import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flamingo/flamingo.dart';

class FeaturedCatFactory {
  static Future createFeaturedCats() async {
    //since we have a lot of data to commit, let's use batch then
    // Batch
    final batch = Batch();
    List<FeaturedCat> featuredCats = [
      FeaturedCat()
        ..name = 'Chadwick'
        ..description =
            'Cats have keen vision; they can see much more detail than dogs.'
        ..catPicture = 'cat/cat-9.jpeg',
      FeaturedCat()
        ..name = 'Boseman'
        ..description =
            'Concentrated in the center of the retina of the eye, a specific type of cell called a cone gives cats excellent visual acuity and binocular vision'
        ..catPicture = 'cat/cat-10.jpeg',
      FeaturedCat()
        ..name = 'Oprah'
        ..description =
            'This allows them to judge speed and distance very well, an ability that helped them survive as hunters.'
        ..catPicture = 'cat/cat-11.jpeg',
    ];

    for (FeaturedCat featuredCat in featuredCats) {
      batch.save(featuredCat);
    }

    //let's commit our change then

    await batch.commit();
  }
}
