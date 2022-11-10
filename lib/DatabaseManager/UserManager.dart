import 'package:cloud_firestore/cloud_firestore.dart';

class UserManage{
  final CollectionReference buyerdata = FirebaseFirestore.instance.collection("Buyer");
  final CollectionReference sellerdata = FirebaseFirestore.instance.collection("Seller");

  Future<void> createBuyerData(String firstName, String lastName, String? uid) async{
    print("buyer");
    return await buyerdata.doc(uid).set({
      "firstName" : firstName,
      "lastName" : lastName,
    });
  }

  Future<void> createSellerData(String firstName, String lastName, String? uid) async{
    print("Seller");
    return await sellerdata.doc(uid).set({
      "firstName" : firstName,
      "lastName" : lastName,
    });
  }

  Future<bool> checkBuyer(String? uid) async
  {
    bool exist = false;
    await buyerdata.doc(uid).get().then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists)
      {
        exist = true;
      }
    });

    return exist;
  }

  Future<bool> checkSeller(String? uid) async
  {

    bool exist = false;
    await sellerdata.doc(uid).get().then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists)
      {
        exist = true;
      }
    }); 
    return exist;
  }


}