const std = @import("std");
const Build = std.build;

pub fn build(b: *Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "main",
        .root_source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
        .target = target,
    });
    exe.addCSourceFiles(.{ .files = &.{"src/code.c"}, .flags = &.{ "-std=c17", "-Wpedantic", "-Wall", "-Wextra", "-Wshadow" } });

    exe.addIncludePath(.{ .path = "src" });

    exe.linkSystemLibrary("c");
    b.installArtifact(exe);

    const run = b.addRunArtifact(exe);
    run.step.dependOn(b.getInstallStep());
}
