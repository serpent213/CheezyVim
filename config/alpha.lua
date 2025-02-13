local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

-- Other themes (startify, theta) don't work?
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "    ___ _____                                                            ",
    "   /\\ (_)    \\                                                           ",
    "  /  \\      (_,                                                          ",
    " _)  _\\   _    \\                                                         ",
    "/   (_)\\_( )____\\      ________                         _    ___         ",
    "\\_     /    _  _/     / ____/ /_  ___  ___  ____  __  _| |  / (_)___ ___ ",
    "  ) /\\/  _ (o)(      / /   / __ \\/ _ \\/ _ \\/_  / / / / / | / / / __ `__ \\",
    "  \\ \\_) (o)   /     / /___/ / / /  __/  __/ / /_/ /_/ /| |/ / / / / / / /",
    "   \\/________/      \\____/_/ /_/\\___/\\___/ /___/\\__, / |___/_/_/ /_/ /_/ ",
    "                                               /____/                    ",
    -- ASCII cheese by mic
}

dashboard.section.buttons.val = {
    dashboard.button("p", "  Projects", ":lua require'telescope'.extensions.project.project{}<CR>"),
    dashboard.button("e", "󱝩  Explorer", ":NvimTreeToggle<CR>"),
    dashboard.button("f", "  Find file", ":Telescope frecency workspace=CWD theme=dropdown<CR>"),
    dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
    dashboard.button("r", "󱝩  Recently used files", ":Telescope oldfiles theme=dropdown<CR>"),
    dashboard.button("q", "  Quit NeoVim", ":qa<CR>"),
}

dashboard.section.footer.val = "let's tell a story."

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = false
alpha.setup(dashboard.opts)
