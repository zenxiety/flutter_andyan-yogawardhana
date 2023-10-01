# Summary of Flutter State Management (BLoC)

## BLoC

- Business Logic Component: memisahkan UI dan logic
- cara kerja
  - menerima event input
  - manipulasi di bloc
  - menghasilkan state output

## Stream

- rangkaian proses utama bloc secara asynchronous
- sink -> stream (async data) -> source

## Penggunaan

- buat di dalam folder /lib/bloc/
- 3 files:
  - bloc : menghubungkan event dan state
    - menggunakan fungsi emit untuk mengirim state
  - event : semua fungsi yang digunakan bloc
  - state : semua state yang dimiliki bloc
- wrap materialapp dengan `BlocProvider<WhichBloc>`
- wrap widget yang membutuhkan state dari bloc dengan `BlocBuilder<WhichBloc, WhichState>`
  - memanggil property dengan `state.property`
- fungsi dipanggil dengan `context.read<WhichBloc>().add(Function())`
