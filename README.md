# ARM Semi-hosting Library

A C and CMake library providing ARM semi-hosting support for embedded ARM development and testing environments.

## Overview

This library provides utilities for ARM semi-hosting, enabling communication between ARM embedded systems and a debugger or host system. It includes support for initialising monitor handles and float-to-string conversion utilities.

## Features

-   **Monitor Handles Initialisation**: Set up file handles for semi-hosting support in testing environments
-   **Float Conversion Utilities**: Convert and print floating-point numbers using the `fcvtf` function
-   **Cross-Platform CMake Build**: Easy integration into embedded ARM projects
-   **MIT Licensed**: Open source and suitable for commercial use

## Components

The project includes the following components.

### Monitor Handles

Provides initialisation of monitor handles for semi-hosting support:

-   `initialise_monitor_handles()` initialises file handles for semi-hosting.

Linking a semi-hosted test with the `arm-semihosting` target library automatically calls the 'monitor handles initialisation' function at "constructor" time.

### Float Conversion

Utilities for floating-point number formatting:

-   `fcvtfprintf()` prints a float with specified decimal precision.

## Building

This project uses CMake for configuration and building:

``` bash
mkdir build
cd build
cmake ..
cmake --build .
```

### Requirements

-   CMake 3.6 or later
-   ARM cross-compiler tool-chain (for ARM targets)
-   Standard C library with math support

## Usage

Include the library in your CMake project as follows; this example assumes you have a project structure where the `arm-semihosting` library is located in a `Third_Party` directory for a project targeting an STM32F407 microcontroller:

``` cmake
add_subdirectory(Third_Party/arm-semihosting)

include(arm-semihosting)
include(qemu-system-arm)
include(CTest)

enable_testing()

set(ARMSemihostingCompileDefinitions
    USE_HAL_DRIVER
    STM32F407xx
    $<$<CONFIG:Debug>:DEBUG>
)
set(ARMSemihostingSystemSources
    ${CMAKE_SOURCE_DIR}/startup_stm32f407xx.s
)
set(ARMSemihostingLinkLibraries
    stm32cubemx
    STM32_Drivers
    arm-semihosting
)

add_arm_semihosting_test(TEST_NAME a_test
    TEST_SOURCES
        ${CMAKE_SOURCE_DIR}/Tests/a_test.c
)
```

Then in your C test code:

``` c
#include <unistd.h>
#include <fcvtf.h>

int main(void) {
    /*
     * Print 3.14 to standard output.
     */
    fcvtfprintf(3.14159, 2);
    _exit(0);
    return 0;
}
```

## Licence

This project is licensed under the MIT Licence---see individual source files for details.
