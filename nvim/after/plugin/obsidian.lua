require'obsidian'.setup {
    workspaces = {
        { name = "work", path = "~/src/schlameuss/notes", },
        { name = "personal", path = "~/src/schlac/zettel", },
    },
    daily_notes = {
        date_format = "%Y/%Y-%m",
        alias_format = "%Y-%m-%d",
    },
    completion = {
        use_path_only = true,
    },
    disable_frontmatter = true,
    ui = {
        -- Define how various check-boxes are displayed
        checkboxes = {
            [" "] = { char = "☐", hl_group = "ObsidianTodo" },
            ["x"] = { char = "☑", hl_group = "ObsidianDone" },
            [">"] = { char = "⭢", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "~", hl_group = "ObsidianTilde" },
        },
    },
}

-- jump to current month notes file
vim.keymap.set("n", "~", function()
    require("obsidian")
    vim.cmd.ObsidianToday()
end)

