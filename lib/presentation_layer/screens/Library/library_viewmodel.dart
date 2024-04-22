import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/BooksModel/allbooks_model.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/main.dart';
import 'package:dio/dio.dart';

class LibraryViewModel {
  getAllBooks() async {
    AllBooksModel? books;
    final dio = DioFactory.getDio();
    var response = await dio.get(ApiEndpoints.getAllBooks,
        options: Options(headers: ApiHeaders.tokenHeader));
    books = AllBooksModel.fromJson(response.data);
    return books;
  }
}
