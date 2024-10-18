import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_dialog.dart'; // Impor EventDialog

class CalendarCard extends StatefulWidget {
  @override
  _CalendarCardState createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> with SingleTickerProviderStateMixin {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initializeEvents();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  void _initializeEvents() {
    _events = {
      DateTime.utc(2024, 10, 16): ['Cek Inventaris Gudang', 'Meeting Tim'],
      DateTime.utc(2024, 10, 17): ['Perbaikan Peralatan', 'Inspeksi Barang'],
      DateTime.utc(2024, 10, 19): ['Laporan Mingguan'],
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              _showEventDialog(selectedDay);
            },
            eventLoader: _getEventsForDay,
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Perbulan',
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black87),
              rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black87),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: const TextStyle(color: Colors.black87),
              weekendTextStyle: const TextStyle(color: Colors.redAccent),
              outsideDaysVisible: false,
              markersMaxCount: 1,
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.black54),
              weekendStyle: TextStyle(color: Colors.redAccent),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showEventDialog(DateTime selectedDay) {
    final events = _getEventsForDay(selectedDay);

    showDialog(
      context: context,
      builder: (context) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeIn,
            ),
          ),
          child: EventDialog(
            selectedDay: selectedDay,
            events: events,
          ),
        );
      },
    );
    _controller.forward(); // Memulai animasi saat dialog muncul
  }
}
