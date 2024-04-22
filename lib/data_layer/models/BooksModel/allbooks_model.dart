class AllBooksModel {
  int? length;
  List<Books>? books;

  AllBooksModel({this.length, this.books});

  AllBooksModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    if (json['Books'] != null) {
      books = <Books>[];
      json['Books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }
}

class Books {
  String? sId;
  String? title;
  String? author;
  int? pages;
  int? chapters;
  String? category;
  String? description;
  String? fileId;
  String? imageUrl;
  String? impageName;
  String? createdAt;
  String? slug;
  int? iV;

  Books(
      {this.sId,
      this.title,
      this.author,
      this.pages,
      this.chapters,
      this.category,
      this.description,
      this.fileId,
      this.imageUrl,
      this.impageName,
      this.createdAt,
      this.slug,
      this.iV});

  Books.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    author = json['author'];
    pages = json['pages'];
    chapters = json['chapters'];
    category = json['category'];
    description = json['description'];
    fileId = json['file_id'];
    imageUrl = json['image_url'];
    impageName = json['impage_name'];
    createdAt = json['createdAt'];
    slug = json['slug'];
    iV = json['__v'];
  }
}
