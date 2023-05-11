import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference _productcollectionRef =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productcollectionRef.get();
    return value.docs;
  }
}
