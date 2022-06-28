import 'package:flamingo/flamingo.dart';

import '../entities/cat.dart';

class CatFactory {
  static Future createCats() async {
    //since we have a lot of data to commit, let's use batch then
    // Batch
    final batch = Batch();
    List<Cat> cats = [
      Cat()
        ..name = 'Luna'
        ..description =
            'A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. countable noun. Cats are lions, tigers, and other wild animals in the same family. The lion is perhaps the most famous member of the cat family.'
        ..catPicture = 'cat/cat-1.jpeg',
      Cat()
        ..name = 'Milo'
        ..description =
            'a double tripod having six legs but resting on only three no matter how it is set down, usually used before or over a fire'
        ..catPicture = 'cat/cat-2.jpeg',
      Cat()
        ..name = 'Oliver'
        ..description =
            'a small, lithe, soft-furred animal (Felis cattus) of this family, domesticated since ancient times and often kept as a pet or for killing mice'
        ..catPicture = 'cat/cat-3.jpeg',
      Cat()
        ..name = 'Leo'
        ..description =
            'a double tripod having six legs but resting on only three no matter how it is set down, usually used before or over a fire'
        ..catPicture = 'cat/cat-4.jpeg',
      Cat()
        ..name = 'Loki'
        ..description =
            'Cats also share the rapid metabolism that dogs have, which results in a higher heart rate, respiratory rate, and temperature than those of people'
        ..catPicture = 'cat/cat-5.jpeg',
      Cat()
        ..name = 'Bella'
        ..description =
            'Cats are better at conserving heat than at cooling themselves, although their small size relative to their large surface area makes for more effective cooling than in dogs'
        ..catPicture = 'cat/cat-6.jpeg',
      Cat()
        ..name = 'Charlie'
        ..description =
            'Cats lose heat through external radiation. They have some sweat glands that aid in evaporative cooling, and licking their fur further improves this process'
        ..catPicture = 'cat/cat-6.jpeg',
      Cat()
        ..name = 'Willow'
        ..description =
            'a small, lithe, soft-furred animal (Felis cattus) of this family, domesticated since ancient times and often kept as a pet or for killing mice'
        ..catPicture = 'cat/cat-7.jpeg',
      Cat()
        ..name = 'Lucy'
        ..description =
            ' any of a family (Felidae) of carnivores, including the lion, tiger, cougar, etc., characterized by a lithe body and, in all species but the cheetah, retractile claws'
        ..catPicture = 'cat/cat-8.jpeg',
      Cat()
        ..name = 'Aretha Franklin'
        ..description =
            'a double tripod having six legs but resting on only three no matter how it is set down, usually used before or over a fire'
        ..catPicture = 'cat/cat-12.jpeg',
      Cat()
        ..name = 'Dua Lipa'
        ..description =
            'However, although the cone cells are also responsible for color vision, it is uncertain whether cats can see colors'
        ..catPicture = 'cat/cat-13.jpeg',
      Cat()
        ..name = 'Halsey'
        ..description =
            'Cats are better at conserving heat than at cooling themselves, although their small size relative to their large surface area makes for more effective cooling than in dogs'
        ..catPicture = 'cat/cat-14.jpeg',
    ];

    for (Cat cat in cats) {
      batch.save(cat);
    }

    //let's commit our change then

    await batch.commit();
  }
}
