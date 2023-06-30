const std = @import("std");
const c = @cImport({
    @cInclude("code.h");
});

pub export fn zig_from_c() void {
    std.debug.print("Step 4: Zig called from C.\n", .{});
}

pub fn main() void {
    std.debug.print("Step 1: Calling C from Zig.\n", .{});
    c.calling_c_from_zig();
}
