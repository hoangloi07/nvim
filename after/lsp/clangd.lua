return {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
    },
    filetypes = {
        "c", "cpp"
    }
}
