# Raport z wykonania symulacji IGA-ADS

## 1. Dane procesora i pamięci
* **Model procesora:** AMD Ryzen 5 5600GT with Radeon Graphics (6 rdzeni, 12 wątków, architektura x86_64)
* **Pamięć RAM:** 2.4 GiB (pamięć przydzielona dla środowiska)

## 2. Log z wywołania CMake wskazujący na możliwość kompilacji IGA-ADS
Konfiguracja środowiska (wykonana poleceniem `just config` wewnątrz kontenera) zakończyła się sukcesem, co potwierdza gotowość do kompilacji:

```text
-- The CXX compiler identification is GNU 13.3.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test ADS_CXX_SUPPORTS_-Wall
-- Performing Test ADS_CXX_SUPPORTS_-Wall - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wextra
-- Performing Test ADS_CXX_SUPPORTS_-Wextra - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wpedantic
-- Performing Test ADS_CXX_SUPPORTS_-Wpedantic - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wunused
-- Performing Test ADS_CXX_SUPPORTS_-Wunused - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wnon-virtual-dtor
-- Performing Test ADS_CXX_SUPPORTS_-Wnon-virtual-dtor - Success
-- Performing Test ADS_CXX_SUPPORTS_-Woverloaded-virtual
-- Performing Test ADS_CXX_SUPPORTS_-Woverloaded-virtual - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wmisleading-indentation
-- Performing Test ADS_CXX_SUPPORTS_-Wmisleading-indentation - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wfloat-conversion
-- Performing Test ADS_CXX_SUPPORTS_-Wfloat-conversion - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wold-style-cast
-- Performing Test ADS_CXX_SUPPORTS_-Wold-style-cast - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wcast-align
-- Performing Test ADS_CXX_SUPPORTS_-Wcast-align - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wconversion
-- Performing Test ADS_CXX_SUPPORTS_-Wconversion - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wsuggest-override
-- Performing Test ADS_CXX_SUPPORTS_-Wsuggest-override - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wlogical-op
-- Performing Test ADS_CXX_SUPPORTS_-Wlogical-op - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wuseless-cast
-- Performing Test ADS_CXX_SUPPORTS_-Wuseless-cast - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wduplicated-cond
-- Performing Test ADS_CXX_SUPPORTS_-Wduplicated-cond - Success
-- Performing Test ADS_CXX_SUPPORTS_-Wduplicated-branches
-- Performing Test ADS_CXX_SUPPORTS_-Wduplicated-branches - Success
-- Found Git: /usr/bin/git (found version "2.43.0") 
-- No git repository found
-- Looking for sgemm_
-- Looking for sgemm_ - not found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE  
-- Looking for sgemm_
-- Looking for sgemm_ - found
-- Found BLAS: /usr/lib/x86_64-linux-gnu/libblas.so  
-- Looking for cheev_
-- Looking for cheev_ - not found
-- Looking for cheev_
-- Looking for cheev_ - found
-- Found LAPACK: /usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libblas.so  
-- Found Boost: /usr/lib/x86_64-linux-gnu/cmake/Boost-1.83.0/BoostConfig.cmake (found suitable version "1.83.0", minimum required is "1.58.0")  
-- Found MUMPS: /usr/lib/x86_64-linux-gnu/libdmumps.so  
-- The Fortran compiler identification is GNU 13.3.0
-- Detecting Fortran compiler ABI info
-- Detecting Fortran compiler ABI info - done
-- Check for working Fortran compiler: /usr/bin/gfortran - skipped
-- Found MPI_CXX: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi_cxx.so (found version "3.1") 
-- Found MPI_Fortran: /usr/lib/x86_64-linux-gnu/libmpi_usempif08.so (found version "3.1") 
-- Found MPI: TRUE (found version "3.1") found components: CXX Fortran 
-- Found OpenMP_Fortran: -fopenmp (found version "4.5") 
-- Found OpenMP: TRUE (found version "4.5") found components: Fortran 
-- Found Boost: /usr/lib/x86_64-linux-gnu/cmake/Boost-1.83.0/BoostConfig.cmake (found suitable version "1.83.0", minimum required is "1.58.0") found components: serialization iostreams 
-- Configuring done (4.1s)
-- Generating done (0.3s)
-- Build files have been written to: /build
```

## 4. Log z kompilacji IGA-ADS
Proces kompilacji (`just build`) przebiegł pomyślnie i zakończył się wygenerowaniem plików wykonywalnych, log zawierał standardowe, niekrytyczne ostrzeżenia:

```text
[104/111] Building CXX object examples/CMakeFiles/ads-example-poisson_2d.dir/poisson/main.cpp.o
In file included from /code/examples/poisson/main.cpp:4:
/code/examples/poisson/poisson.hpp: In lambda function:
/code/examples/poisson/poisson.hpp:46:57: warning: unused parameter 't' [-Wunused-parameter]
   46 |         dirichlet_bc(u, boundary::left, x, y, [](double t) { return 0; });
      |                                                         ~^
/code/examples/poisson/poisson.hpp: In lambda function:
/code/examples/poisson/poisson.hpp:47:58: warning: unused parameter 't' [-Wunused-parameter]
   47 |         dirichlet_bc(u, boundary::right, x, y, [](double t) { return 0; });
      |                                                          ~^
/code/examples/poisson/poisson.hpp: In lambda function:
/code/examples/poisson/poisson.hpp:48:56: warning: unused parameter 't' [-Wunused-parameter]
   48 |         dirichlet_bc(u, boundary::top, x, y, [](double t) { return 0; });
      |                                                        ~^
/code/examples/poisson/poisson.hpp: In lambda function:
/code/examples/poisson/poisson.hpp:49:59: warning: unused parameter 't' [-Wunused-parameter]
   49 |         dirichlet_bc(u, boundary::bottom, x, y, [](double t) { return 0; });
      |                                                           ~^
[108/111] Building CXX object examples/CMakeFiles/ads-example-fire.dir/fire/fire.cpp.o
In file included from /code/examples/fire/fire.cpp:4:
/code/examples/fire/fire.hpp: In lambda function:
/code/examples/fire/fire.hpp:98:36: warning: unused parameter 'x' [-Wunused-parameter]
   98 |         auto fuel_init = [](double x, double y) { return 1; };
      |                             ~~~~~~~^
/code/examples/fire/fire.hpp:98:46: warning: unused parameter 'y' [-Wunused-parameter]
   98 |         auto fuel_init = [](double x, double y) { return 1; };
      |                                       ~~~~~~~^
/code/examples/fire/fire.hpp: In lambda function:
/code/examples/fire/fire.hpp:129:22: warning: variable 'x' set but not used [-Wunused-but-set-variable]
  129 |                 auto x = point(e, q);
      |                      ^
/code/examples/fire/fire.hpp: In member function 'void ads::problems::fire::compute_rhs(double)':
/code/examples/fire/fire.hpp:116:29: warning: unused parameter 't' [-Wunused-parameter]
  116 |     void compute_rhs(double t) {
      |                      ~~~~~~~^
[111/111] Linking CXX executable examples/dg_laplace
```

## 5. Listing katalogu po uruchomieniu ./heat_2d
Wywołanie symulacji (1000 kroków z `dt` = 1e-05) oraz wygenerowane pliki wynikowe:

```text
root@0c164777242e:/code/res/wyniki# /build/examples/heat_2d 1000 1e-05
Uruchamiam: kroki = 1000, dt = 1e-05
integration: 1592
root@0c164777242e:/code/res/wyniki# ls -l
total 23892
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 init.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_0.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_100.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_200.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_300.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_400.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_500.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_600.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_700.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_800.data
-rw-r--r-- 1 root root 2222055 Oct 20 20:46 out_900.data
```

## Metodologia badań stabilności (dla punktów 6 i 7)
Kod źródłowy pliku `heat_2d.cpp` zmodyfikowano, tak aby liczba kroków i krok czasowy (`dt`) były przyjmowane z poziomu wiersza poleceń. Do automatyzacji uruchomień, zarządzania plikami oraz generowania animacji w formacie `.gif` wykorzystano własne skrypty `run_sim.sh` (Bash) oraz `anim.gp` (Gnuplot).

## 6. Jaki największy krok czasowy nie powoduje eksplozji symulacji?
Największy krok czasowy pozwalający na stabilne przeliczenie symulacji to **2.9e-05**.

![Animacja wyników symulacji z maksymalnym stabilnym krokiem czasowym](/res/2.9e-05/heat_2d_10000.gif)

## 7. Jaki najmniejszy krok czasowy powoduje eksplozję symulacji?
Najmniejszy krok czasowy powodujący widoczną niestabilność i "eksplozję" symulacji to **2.91e-05**.

![Animacja eksplozji symulacji po przekroczeniu krytycznego kroku czasowego](/res/2.91e-05/heat_2d_10000.gif)
