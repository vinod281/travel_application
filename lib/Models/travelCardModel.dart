class TCard {
  String title;
  String imageURL;
  String description;

  TCard({
    required this.title,
    required this.imageURL,
    required this.description,
  });

  static List<TCard> cardList()
  {
    return[

      TCard(title: "Sigiriya", imageURL: "https://www.storiesbysoumya.com/wp-content/uploads/2021/11/sigiriya-rock-fortress.jpg", description: "Sigiriya Rock (1785)")

    ];
  }
  
}
