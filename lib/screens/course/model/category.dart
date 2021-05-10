
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
  {"name": "Introductory C Programming", 'courses': 4 , 'image': "assets/images/intro_c_prog.png", 'screening': "intro_c"},
  {"name": "C Programming For Beginners", 'courses': 4, 'image': "assets/images/c_for_beg.png", 'screening': "c_prog_begin"},
  {"name": "Advanced C Programming", 'courses': 4, 'image': "assets/images/adv_prog.png", 'screening': "adva_c"},
  {"name": "Advanced C Pointers", 'courses': 3, 'image': "assets/images/Advance_c_pointer.png", 'screening': "adva_c_point"},
];
