#include <stdio.h>
#include "code.h"
#include "zig.h"

void
calling_c_from_zig(void)
{
  puts("Step 2: C Called from Zig.");
  calling_zig_from_c();
}

void
calling_zig_from_c(void)
{
  puts("Step 3: Calling Zig from C.");
  zig_from_c();
}
