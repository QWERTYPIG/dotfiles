---MONITORS---
hl.monitor({
    output="eDP-1",
    mode="preferred",
    position="auto",
    scale=2
})
hl.monitor({
    output="",
    mode="preferred",
    position="auto",
    scale=2,
    mirror="eDP-1"
})

---VARIABLES---
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

---AUTOSTART---
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/brightness_manager.sh")
    hl.exec_cmd("waybar & hyprpaper & swaync & hypridle & fcitx5 & nm-applet --indicator & blueman-applet & wl-gammarelay-rs")
    hl.exec_cmd(terminal)
    hl.exec_cmd("swaync & hypridle & fcitx5 & nm-applet --indicator & blueman-applet & wl-gammarelay-rs")
end)
---ENVIRONMENT VAIRABLES---
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRSHOT_DIR","/home/Qwertypig/Pictures/Screenshots/")
hl.env("GTK_USE_PORTAL","1")
hl.env("XDG_CURRENT_DESKTOP","Hyprland")
hl.env("XDG_SESSION_DESKTOP","Hyprland")
hl.env("AQ_DRM_DEVICES","/dev/dri/card1:/dev/dri/card2")
hl.env("LIBVA_DRIVER_NAME","nvidia")
hl.env("XDG_SESSION_TYPE","wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME","nvidia")

---LOOK AND FEEL---
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,

        col = {
            active_border = { colors = {"rgba(89b4faee)", "rgba(89dcebee)"}, angle = 135 },
            inactive_border = "rgba(595959aa)"
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true
    }
})
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})
-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

---INPUT---
hl.config({
    input = {
        kb_layout = "us,cn",
        kb_options = "grp:alt_space_toggle",
        kb_model = "",
        kb_variant = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    }
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = function()
        hl.exec_cmd("playerctl play-pause")
    end
})
hl.gesture({
    fingers = 4,
    direction = "up",
    action = function()
        hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
    end
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = function()
        hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    end
})
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---KEYBINDING---
local mainMod = "SUPER"
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("ALT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("ALT + A", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("ALT + minus", hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d -0.05"), {flags = "e"})
hl.bind("ALT + equal", hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d +0.05"), {flags = "e"})
hl.bind("ALT + up", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ "), {flags = "e"})
hl.bind("ALT + down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- "), {flags = "e"})

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---WINDOWS AND WORKSPACES---
hl.window_rule{
    name = "zen-upload",
    match = {class = "xdg-desktop-portal-gtk"},
    float = true,
    size = {900, 600},
    center = true,
}
hl.window_rule{
    name = "discord-upload",
    match = {title = "(Open Files)"},
    float = true,
    size = {900, 600},
    center = true,
}
hl.window_rule{
    name = "image-preview",
    match = {class = "imv"},
    float = true,
    size = {900, 600},
    center = true,
}
hl.window_rule{
    name = "pdf-preview",
    match = {class = "org.gnome.Evince-previewer"},
    float = true,
    size = {900, 600},
    center = true,
}
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)
hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
