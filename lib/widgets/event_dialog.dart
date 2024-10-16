import 'package:flutter/material.dart';

class EventDialog extends StatelessWidget {
  final DateTime selectedDay;
  final List<String> events;

  const EventDialog({
    Key? key,
    required this.selectedDay,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Kegiatan pada ${selectedDay.toLocal().toString().split(' ')[0]}',
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      content: events.isNotEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: events.map((event) {
                return ListTile(
                  leading: Icon(Icons.event, color: Colors.blueAccent),
                  title: Text(event),
                );
              }).toList(),
            )
          : const Text('Tidak ada kegiatan pada tanggal ini.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Tutup'),
        ),
      ],
    );
  }
}
