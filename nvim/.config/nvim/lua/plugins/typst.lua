return {
    'chomosuke/typst-preview.nvim',
    version = '1.*',
    opts = {
        dependencies_bin = { ['tinymist'] = 'tinymist' }
    }, -- lazy.nvim will implicitly calls `setup {}`
}
