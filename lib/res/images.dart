enum images {
  fog_6126432_1920,
  home_fog_6126432_1920,
  home_fog_6126432_1920_2,
}

extension ImagesName on images {
  String get name {
    switch(this) {
      case images.fog_6126432_1920:
        return 'assets/images/fog_6126432_1920.jpg';
      case images.home_fog_6126432_1920:
        return 'assets/images/home/fog_6126432_1920.jpg';
      case images.home_fog_6126432_1920_2:
        return 'assets/images/home/fog_6126432_1920_2.jpg';
    }
  }
}
