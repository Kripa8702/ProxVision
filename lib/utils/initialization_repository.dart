import 'package:proxvision/utils/colored_logs.dart';
import 'package:proxvision/utils/dio_client.dart';

class InitializationRepository {
  late DioClient dioClient;

  Future<void> init() async {
    dioClient = DioClient();
    ColoredLogs.success("::::::::::::::::::::: DioClient Initialized :::::::::::::::::::::");
  }
}
