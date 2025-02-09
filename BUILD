load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@rules_go//go:def.bzl", "TOOLS_NOGO", "nogo")

# gazelle:prefix github.com/ellie-idb/bazel-go-starter-repo
gazelle(
    name = "gazelle",
    gazelle = ":gazelle-go",
)

alias(
    name = "gofumpt",
    actual = "@cc_mvdan_gofumpt//:gofumpt",
)

alias(
    name = "golangci-lint",
    actual = "@com_github_golangci_golangci_lint//cmd/golangci-lint",
)

gazelle_binary(
    name = "gazelle-go",
    languages = [
        "@bazel_gazelle//language/go",
    ],
    visibility = ["//visibility:public"],
)

nogo(
    name = "nogo",
    visibility = ["//visibility:public"],  # must have public visibility
    deps = [
        "@org_golang_x_tools//go/analysis/passes/asmdecl:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/assign:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/atomic:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/atomicalign:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/bools:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/buildssa:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/buildtag:go_default_library",
        # TODO(#2396): pass raw cgo sources to cgocall and re-enable.
        # "@org_golang_x_tools//go/analysis/passes/cgocall:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/composite:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/copylock:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/ctrlflow:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/deepequalerrors:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/errorsas:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/findcall:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/httpresponse:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/ifaceassert:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/inspect:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/loopclosure:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/lostcancel:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/nilfunc:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/nilness:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/pkgfact:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/printf:go_default_library",
        # "@org_golang_x_tools//go/analysis/passes/shadow:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/shift:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/sortslice:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/stdmethods:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/stringintconv:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/structtag:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/testinggoroutine:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/tests:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/unmarshal:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/unreachable:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/unsafeptr:go_default_library",
        "@org_golang_x_tools//go/analysis/passes/unusedresult:go_default_library",
    ],
)
