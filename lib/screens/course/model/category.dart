
class Category {
  final String name;
  final int numOfCourses;
  final String image;
  final String screening;

  Category(this.name, this.numOfCourses, this.image, this.screening);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image'], item['screening']))
    .toList();

var categoriesData = [
  {"name": "Introductory C Programming", 'courses': 4 , 'image': "assets/images/marketing.png", 'screening': "intro_c"},
  {"name": "C Programming For Beginners", 'courses': 4, 'image': "assets/images/ux_design.png", 'screening': "c_prog_begin"},
  {"name": "Advanced C Programming Course", 'courses': 4, 'image': "assets/images/photography.png", 'screening': "adva_c"},
  {"name": "Advanced C Pointers", 'courses': 3, 'image': "assets/images/business.png", 'screening': "adva_c_point"},
];
