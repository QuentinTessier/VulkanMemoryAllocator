const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardTargetOptions(.{});

    const lib = b.addStaticLibrary(.{
        .name = "VulkanMemoryAllocator",
        .target = target,
        .optimize = optimize,
    });
    lib.linkLibCpp();
    lib.addCSourceFiles(.{ .files = sources });
    lib.addIncludePath(.{ .path = "include" });
    lib.addIncludePath(.{ .path = "src" });
    b.installArtifact(lib);
}

const sources = &[_][]const u8{
    "Common.cpp",
    "SparseBindingTest.cpp",
    "Tests.cpp",
    "VmaUsage.cpp",
    "VulkanSample.cpp",
};
