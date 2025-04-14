local ok, lh = pcall(require, 'local-highlight')
if ok then
    lh.setup({
        disable_file_types = {'tex'},
        hlgroup = 'IncSearch',
        cw_hlgroup = 'CurSearch',
        insert_mode = true,
        min_match_len = 3,
        max_match_len = 64,
        animate = {
            enabled = false,
            easing = "linear",
            duration = {
                step = 10, -- ms per step
                total = 100, -- maximum duration
            },
        },
    })
end
