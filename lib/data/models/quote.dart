class Quote {
late String quote;
late String author;

Quote.fromJson(Map<String,dynamic>json){
  quote = json['quote'];
  author = json['character'];

}
}