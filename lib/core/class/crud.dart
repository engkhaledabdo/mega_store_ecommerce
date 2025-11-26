import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../functions/checkinternet.dart';
import 'statusRequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map resonsebody = jsonDecode(response.body);
          debugPrint(resonsebody.toString());
          return Right(resonsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
    // if (await checkInternet()) {
    //   var response = await http.post(Uri.parse(linkurl), body: data);
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     Map resonsebody = jsonDecode(response.body);
    //     print(resonsebody);
    //     return Right(resonsebody);
    //   } else {
    //     return const Left(StatusRequest.serverfailure);
    //   }
    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }
}

class CrudMix {
  late http.Response response; // late initialization

  Future<Either<StatusRequest, Map>> request(
      String linkurl, Map data, HttpMethod method) async {
    try {
      if (await checkInternet()) {
        if (method == HttpMethod.get) {
          response = await http.get(Uri.parse(linkurl));
        } else if (method == HttpMethod.post) {
          response = await http.post(Uri.parse(linkurl), body: data);
        }

        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          debugPrint(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}

enum HttpMethod { get, post }
