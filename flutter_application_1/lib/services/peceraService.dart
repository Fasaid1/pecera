import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/peceraModel.dart';

class PeceraService {
  final String _baseUrl = 'http://10.0.2.2:3000/api/pecera';

  Future<List<Pecera>> getAllPeceras() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<Pecera> peceras = body
            .map(
              (dynamic item) => Pecera.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return peceras;
      } else {
        print(
            'Error en getAllPeceras: ${response.statusCode} - ${response.body}');
        throw Exception('Error al obtener las peceras del servidor.');
      }
    } catch (e) {
      print('Excepción al obtener las peceras: $e');
      throw Exception(
          'Excepción al conectar con el servidor para obtener peceras.');
    }
  }

  Future<Pecera?> getPeceraById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        return Pecera.fromJson(body);
      } else if (response.statusCode == 404) {
        print('Pecera con ID $id no encontrada.');
        return null;
      } else {
        print(
            'Error en getPeceraById: ${response.statusCode} - ${response.body}');
        throw Exception('Error al obtener la pecera del servidor.');
      }
    } catch (e) {
      print('Excepción al obtener la pecera con ID $id: $e');
      throw Exception(
          'Excepción al conectar con el servidor para obtener pecera por ID.');
    }
  }

  Future<Pecera?> createPecera(Pecera pecera) async {
    try {
      final Map<String, dynamic> requestBody = {
        "nombrePecera": pecera.nombrePecera,
        "cantidadPeces": pecera.cantidadPeces,
        "cantidadOxigenoDisuelto": pecera.cantidadOxigenoDisuelto,
        "nivelAgua": pecera.nivelAgua,
        "cantidadPh": pecera.cantidadPh,
        "fechaSiembra": pecera.fechaSiembra.toIso8601String(),
        "estado": pecera.estado,
        "esDestacada": pecera.esDestacada,
      };

      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 409 || response.statusCode == 200) {
        if (responseBody.containsKey('pecera') &&
            responseBody['pecera'] != null) {
          return Pecera.fromJson(
              responseBody['pecera'] as Map<String, dynamic>);
        } else if (responseBody.containsKey('status') &&
            responseBody['status'] == 'error') {
          final String errorMessage =
              responseBody['message'] ?? 'Error conocido al crear la pecera.';
          print('Error de API al crear pecera: $errorMessage');
          throw Exception(errorMessage);
        } else {
          print(
              'Respuesta inesperada del servidor (éxito pero formato desconocido): ${response.body}');
          throw Exception(
              'Respuesta inesperada del servidor al crear la pecera.');
        }
      } else {
        final String errorMessage =
            responseBody['message'] ?? 'Error desconocido del servidor.';
        print(
            'Error HTTP al crear la pecera: ${response.statusCode} - $errorMessage');
        throw Exception(
            'Error del servidor (${response.statusCode}): $errorMessage');
      }
    } catch (e) {
      print('Excepción al crear la pecera: $e');
      if (e is Exception) {
        throw e;
      }
      throw Exception(
          'Excepción al conectar con el servidor para crear pecera.');
    }
  }

  Future<bool> updateFeatured(int peceraId, bool esDestacada) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/destacada/$peceraId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"esDestacada": esDestacada ? 1 : 0}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print('Respuesta del servidor: $responseBody');

        if (responseBody.containsKey('pecera') &&
            responseBody['pecera'] is List) {
          return true;
        } else {
          throw Exception('Respuesta inesperada del servidor.');
        }
      } else if (response.statusCode == 404) {
        print('Pecera no encontrada.');
        return false;
      } else {
        print('Error al actualizar destacada: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Excepción al actualizar pecera destacada: $e');
      throw Exception(
          'Excepción al conectar con el servidor para actualizar pecera destacada.');
    }
  }
}
