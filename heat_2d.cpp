// SPDX-FileCopyrightText: 2015 - 2023 Marcin Łoś <marcin.los.91@gmail.com>
// SPDX-License-Identifier: MIT

#include "heat_2d.hpp"
#include <cstdlib>
#include <iostream>

int main(int argc, char* argv[]) {
    int n_steps = 10000;
    double dt = 1e-5;

    // Pobieranie parametrów z argumentów wywołania
    if (argc >= 3) {
        n_steps = std::atoi(argv[1]);
        dt = std::atof(argv[2]);
        std::cout << "Uruchamiam: kroki = " << n_steps << ", dt = " << dt << std::endl;
    }

    ads::dim_config dim{2, 40};
    ads::timesteps_config steps{n_steps, dt};
    int ders = 1;

    ads::config_2d c{dim, dim, steps, ders};
    ads::problems::heat_2d sim{c};
    sim.run();
}