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
    workspaces = {
        { name = "work", path = "~/src/schlameuss/notes", },
        { name = "personal", path = "~/src/schlac/zettel", },
    },
    daily_notes = {
        date_format = "%Y/%Y-%m",
        alias_format = "%Y-%m-%d",
    },
    wiki_link_func = function(opts)
        -- behave like use_path_only = true
        return string.format("[[%s]]", opts.path)
    end,
    disable_frontmatter = true,
    ui = {
        -- Define how various check-boxes are displayed
        checkboxes = {
            [" "] = { char = "☐", hl_group = "ObsidianTodo" },
            ["x"] = { char = "☑", hl_group = "ObsidianDone" },
            [">"] = { char = "⭢", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "~", hl_group = "ObsidianTilde" },
        },
        bullets = { char = "■", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    },
}

-- jump to current month notes file
vim.keymap.set("n", "~", function()
    require("obsidian")
    vim.cmd.ObsidianToday()
end)

