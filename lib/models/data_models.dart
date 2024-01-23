class HashTagsModel{
  String title;

  HashTagsModel({required this.title});
}

class BlogModel{
  String? id;
  String? imageUrl;
  String? title;
  String? writer;
  String? writerImageUrl;
  String? date;
  String? content;
  String? views;


  BlogModel({
     this.id,
     this.imageUrl,
     this.title,
     this.writer,
     this.writerImageUrl,
     this.date,
     this.content,
     this.views
  });

}