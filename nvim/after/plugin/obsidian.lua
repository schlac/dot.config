-- only continue if notes dirs exist
if vim.fn.isdirectory("/home/chrschla/src/schlameuss/notes/") == 0 then
    print("no notes dir 1")
    return
end
if vim.fn.isdirectory("/home/chrschla/src/schlac/zettel/") == 0 then
    print("no notes dir 2")
    return
end

require'obsidian'.setup {
    legacy_commands = false,
    workspaces = {
        { name = "work", path = "~/src/schlameuss/notes/", },
        {
            name = "personal", path = "~/src/schlac/zettel/",
            overrides = {
                daily_notes = { date_format = "%Y-%m", },
            },
        },
    },
    daily_notes = {
        date_format = "%Y/%Y-%m",
        alias_format = "%Y-%m-%d",
    },
    wiki_link_func = function(opts)
        -- behave like use_path_only = true
        return string.format("[[%s]]", opts.path)
    end,
    wiki_link_func = "use_alias_only",
    preferred_link_style = "wiki", -- Either 'wiki' or 'markdown'

    disable_frontmatter = true,
    ui = {
        -- Define how various check-boxes are displayed
        checkbox = {
            order = { " ", "!", "x", },
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["!"] = { char = "", hl_group = "ObsidianImportant" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
        bullets = { "■", hl_group = "ObsidianBullet" },
        external_link_icon = { "" },
        hl_groups = {
            ObsidianTodo = { bold = true, fg = "#f78c6c" },
            ObsidianDone = { bold = true, fg = "#09d00f" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianImportant = { bold = true, fg = "#d73128" },
            ObsidianBullet = { bold = true, fg = "#09d00f" },
            ObsidianRefText = { underline = true, fg = "#07920a" },
            ObsidianExtLinkIcon = { fg = "#07920a" },
            ObsidianTag = { italic = true, fg = "#09d00f" },
            ObsidianBlockID = { italic = true, fg = "#09d00f" },
            ObsidianHighlightText = { bg = "#75662e" },
        },
    },
}

-- jump to current month notes file
vim.keymap.set("n", "~", function()
    require("obsidian")
    vim.cmd.Obsidian('today')
    vim.cmd.cd('~/src/schlameuss/notes')
end)

