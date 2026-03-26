load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")
load("@rules_cc//cc/common:cc_common.bzl", "cc_common")
load("@rules_cc//cc/toolchains:cc_toolchain_config_info.bzl", "CcToolchainConfigInfo")

def _impl(ctx):
    tool_paths = [
        tool_path(name = "gcc", path = "msvc/bin/x64/cl.exe"),
        tool_path(name = "ld", path = "msvc/bin/x64/link.exe"),
        tool_path(name = "ar", path = "msvc/bin/x64/lib.exe"),

        tool_path(name = "cpp", path = "/bin/false"),
        tool_path(name = "dwp", path = "/bin/false"),
        tool_path(name = "gcov", path = "/bin/false"),
        tool_path(name = "nm", path = "/bin/false"),
        tool_path(name = "objcopy", path = "/bin/false"),
        tool_path(name = "objdump", path = "/bin/false"),
        tool_path(name = "strip", path = "/bin/false"),
    ]
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "msvc-linux",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "x86_64",
        target_libc = "local",
        compiler = "msvc-cl",
        abi_version = "local",
        abi_libc_version = "local",
        tool_paths = tool_paths,
    )

msvc_cc_toolchain_config = rule(
    implementation = _impl,
    provides = [CcToolchainConfigInfo],
)
