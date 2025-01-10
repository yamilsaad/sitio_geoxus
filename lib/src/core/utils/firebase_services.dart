import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  // Método para obtener la URL de descarga de Firebase Storage
  Future<String> getDownloadUrl(String gsPath) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(gsPath);
      return await ref.getDownloadURL();
    } catch (e) {
      print("Error getting download URL: $e");
      return '';
    }
  }
}
