import 'package:flutter/material.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';

// "https://www.postman.com/collections/94db931dc503afd508a5";
//https://www.postman.com/collections/3223d639447a8524e38f




const LOGIN ='login';
const REGISTER ='register';
const HOME ='home';
const CATEGORIES ='categories';
const FAVORITES ='favorites';
const SEARCH_PROD ='products/search';

const PROFILE ='profile';


//String? token = '';

String? token = Cachehelper.getData(key: "'token");