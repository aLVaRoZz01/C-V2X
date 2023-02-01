#include <iostream>
#include <libsumo/libtraci.h>

using namespace libtraci;

int main(int argc, char* argv[]) {
    Simulation::start({"sumo", "-c", "traciTest.sumocfg"});
    for (int i = 0; i < 200; i++) {
        Simulation::step();
    }
    Simulation::close();
}
