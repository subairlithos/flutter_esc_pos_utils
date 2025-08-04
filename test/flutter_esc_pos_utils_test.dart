import 'dart:typed_data';

import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
    TestWidgetsFlutterBinding.ensureInitialized();
  test('adds one to input values', () async{
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    final img.Image blackImage = img.Image(width: PaperSize.mm80.width, height: 30000);
    img.fill(blackImage, color: img.ColorUint1.rgba(0, 0, 0, 255));

    final Uint8List png= img.encodePng(blackImage);
    final printImage=img.decodeImage(png);
    final start=DateTime.now();
    generator.quickImage2(printImage!);
    final end=DateTime.now();
    print(end.difference(start));
  });
}
