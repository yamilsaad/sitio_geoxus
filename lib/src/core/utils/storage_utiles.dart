import 'package:firebase_storage/firebase_storage.dart';

class StorageUtils {
  /// Obtiene la URL pública de descarga de un archivo almacenado en Firebase Storage.
  /// [gsPath] debe ser la ruta de almacenamiento en formato 'gs://'.
  static Future<String> getDownloadUrl(String gsPath) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(gsPath);
      return await ref.getDownloadURL();
    } catch (e) {
      print("Error getting download URL: $e");
      return ''; // Retorna una cadena vacía si ocurre un error.
    }
  }
}
