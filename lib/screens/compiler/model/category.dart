
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
  {"name": "C", 'state': "Stable" , 'image': "assets/images/marketing.png", 'screening': "c_web"},
  {"name": "C++", 'state': "Beta", 'image': "assets/images/ux_design.png", 'screening': "c++_web"},
  {"name": "Java", 'state': "Devloping", 'image': "assets/images/photography.png", 'screening': "java"},
];
