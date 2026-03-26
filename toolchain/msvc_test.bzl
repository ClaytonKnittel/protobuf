load("@bazel_tools//tools/cpp:msvc_cc_toolchain_config.bzl", "msvc_cc_toolchain_config")

def test():
    print(msvc_cc_toolchain_config)
