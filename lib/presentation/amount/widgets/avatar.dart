part of '../view.dart';

class _Avatar extends StatelessWidget {
  final String url;

  const _Avatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(url),
      radius: 35,
    );
  }
}
