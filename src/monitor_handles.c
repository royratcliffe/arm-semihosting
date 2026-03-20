#include <monitor_handles.h>

static void initialise(void) __attribute__((constructor));
static void initialise(void) { initialise_monitor_handles(); }
