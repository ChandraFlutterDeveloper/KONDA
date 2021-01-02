import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:retrofit/http.dart';
import '../Model/MovieModel.dart';
class MovieService {

static const BASE_URL = "konda.co.in/";

  Future<String> addMovie(MovieModel movieModel)async{
    final response =await http.post(BASE_URL ,body: movieModel.toJsonAdd());
    if (response.statusCode == 200){
      return response.body;
    }else{
      return "Error";
    }
  }

  List<MovieModel> movieFromJson(String jsonString){
    final data = json.decode(jsonString);
    return List<MovieModel>.from(data.map((item)=>MovieModel.fromJson(item)));
  }

  Future<List<MovieModel>> getMovie()async{
    final response = await http.get(BASE_URL +"Movie_List");
    if (response.statusCode == 200) {
      List<MovieModel> list = movieFromJson(response.body);
      return list;
    }else{
      return List<MovieModel>();
    }
  }

  Future<String> DeleteMovie(MovieModel movieModel)async{
    final response =await http.post(BASE_URL ,body: movieModel.toJsonAdd());
    if (response.statusCode == 200){
      return response.body;
    }else{
      return "Error";
    }
  }

}



