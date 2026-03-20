# CMake configuration for QEMU System ARM emulator.

find_program(QEMU_SYSTEM_ARM qemu-system-arm)

# QEMU System ARM emulator configuration for cross-compiling tests.
set(CMAKE_CROSSCOMPILING_EMULATOR ${QEMU_SYSTEM_ARM}
    -machine netduinoplus2
    -nographic
    -no-reboot
    -semihosting-config enable=on,target=native
    -kernel
)
