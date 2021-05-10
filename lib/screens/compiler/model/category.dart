
class Category {
  final String name;
  final String state;
  final String image;
  final String screening;

  Category(this.name, this.state, this.image, this.screening);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['state'], item['image'], item['screening']))
    .toList();

var categoriesData = [
  {"name": "C", 'state': "Stable" , 'image': "assets/compiler/c.png", 'screening': "c_web"},
  {"name": "C++", 'state': "Beta", 'image': "assets/compiler/cplus.png", 'screening': "c++_web"},
  {"name": "Java", 'state': "Devloping", 'image': "assets/compiler/java.png", 'screening': "java"},
];
