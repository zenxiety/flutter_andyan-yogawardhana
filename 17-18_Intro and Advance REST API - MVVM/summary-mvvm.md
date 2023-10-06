# Summary of MVVM Architecture

## MVVM

- Model-View ViewModel
- Memisahkan logic dengan UI ke ViewModel
  - model: service, model
  - view: UI screens
  - viewmodel: provider, bloc, controller
- Keuntungan
  - reusability : UI dengan logic sama menggunakan VM/class yang sama
  - maintainability : UI terpisah dengan logic; mudah searching
  - testability : pengujian terpisah (UI dan logic); bisa ditest
  - enak dibaca
- mirip sama mvc : viewmodel == controller

## Rules

- Directory/Folders
  1.  models : bentuk dan sumber data dalam class; data di property
  2.  services : class untuk memanggil API (Dio); 1 function 1 API
  - local services : local storage
  - network services : data API/firebase
  3.  controllers : bloc/provider
  4.  views
  5.  screens : view dan viewmodel (bisa dipisah view dan vm)
  - (opt) utils: bantuan/helper => constants, app state
- Multiprovider untuk banyak VM di parent materialapp
  - viewmodel : data dan logic screen; bisa dipakai banyak widget/screens
  - view : menggunakan data getters VM di widgets

## Additional Notes (Live Session)

- clean architecture : data melewati banyak layer
  - terlalu redundant dan tidak semua terlalu dibutuhkan
- context.mounted : untuk solve problem build context di async
- define controller di initState; setelah dipakai wajib dispose
