import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do/models/list_model.dart';

Future<List<ListModel>> getData() async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('list').select('*');
  print(data);
  List<ListModel> objectList = [];
  for (var element in data) {
    objectList.add(ListModel.fromJson(element));
  }
  print(objectList);
  return objectList;
}
