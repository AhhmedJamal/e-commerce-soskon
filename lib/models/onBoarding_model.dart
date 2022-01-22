class BordingModel {
  final String image;
  final String title;
  final String subTitle;

  BordingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<BordingModel> bording = [
  BordingModel(
    image: 'assets/images/pagee1.json',
    title: 'title1',
    subTitle: 'supTitle1',
  ),
  BordingModel(
    image: 'assets/images/pagee2.json',
    title: 'title2',
    subTitle: 'supTitle2',
  ),
  BordingModel(
    image: 'assets/images/pagee3.json',
    title: 'title3',
    subTitle: 'supTitle3',
  ),
];



  // List<String> images = [
  //   'assets/images/pagee1.json',
  //   'assets/images/pagee2.json',
  //   'assets/images/pagee3.json',
  // ];