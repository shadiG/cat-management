import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flamingo/flamingo.dart';

class FeaturedCatFactory {
  static void createFeaturedCats() async {
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
      FeaturedCat()
        ..name = 'Aretha Franklin'
        ..description =
            'a double tripod having six legs but resting on only three no matter how it is set down, usually used before or over a fire'
        ..catPicture = 'cat/cat-12.jpeg',
      FeaturedCat()
        ..name = 'Dua Lipa'
        ..description =
            'However, although the cone cells are also responsible for color vision, it is uncertain whether cats can see colors'
        ..catPicture = 'cat/cat-13.jpeg',
      FeaturedCat()
        ..name = 'Halsey'
        ..description =
            'Cats are better at conserving heat than at cooling themselves, although their small size relative to their large surface area makes for more effective cooling than in dogs'
        ..catPicture = 'cat/cat-14.jpeg',
    ];

    for (FeaturedCat featuredCat in featuredCats) {
      batch.save(featuredCat);
    }

    //let's commit our change then

    await batch.commit();
  }
}
