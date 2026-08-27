# tmux Cheat Sheet

**Prefix:** `Ctrl-a`

> `<prefix> x` = press `Ctrl-a`, release, then press `x`.

## Sessions

| Action         | Hotkey / Command        |
| -------------- | ----------------------- |
| New session    | `tmux new -s <name>`    |
| List sessions  | `tmux ls`               |
| Attach session | `tmux attach -t <name>` |
| Detach         | `<prefix> d`            |

## Windows

| Action              | Hotkey         |
| ------------------- | -------------- |
| New window          | `<prefix> c`   |
| Rename window       | `<prefix> ,`   |
| Next window         | `<prefix> n`   |
| Previous window     | `<prefix> p`   |
| Last window         | `<prefix> l`   |
| Go to window        | `<prefix> 1-9` |
| List/select windows | `<prefix> w`   |
| Close window        | `<prefix> &`   |

## Panes

| Action           | Hotkey        |
| ---------------- | ------------- |
| Split left/right | `<prefix> \|` |
| Split top/bottom | `<prefix> -`  |
| Close pane       | `<prefix> x`  |
| Zoom/unzoom pane | `<prefix> m`  |

## Navigate Panes

Works between **tmux panes and Neovim splits**.

| Direction | Hotkey   |
| --------- | -------- |
| ← Left    | `Ctrl-h` |
| ↓ Down    | `Ctrl-j` |
| ↑ Up      | `Ctrl-k` |
| → Right   | `Ctrl-l` |

```text id="u2fj8e"
              Ctrl-k
                 ↑
                 │
Ctrl-h  ←   current   →  Ctrl-l
                 │
                 ↓
              Ctrl-j
```

## Resize Panes

| Direction | Hotkey       |
| --------- | ------------ |
| ← Left    | `<prefix> h` |
| ↓ Down    | `<prefix> j` |
| ↑ Up      | `<prefix> k` |
| → Right   | `<prefix> l` |

Repeat the direction without pressing the prefix again:

```text id="32u65k"
Ctrl-a l l l l
```

## Copy / Scroll Mode

| Action          | Hotkey              |
| --------------- | ------------------- |
| Enter copy mode | `<prefix> [`        |
| Move            | `h j k l`           |
| Page down/up    | `Ctrl-d` / `Ctrl-u` |
| Top             | `g`                 |
| Bottom          | `G`                 |
| Search          | `/`                 |
| Start selection | `v`                 |
| Copy            | `y`                 |
| Exit            | `q`                 |

## Useful

| Action             | Hotkey       |
| ------------------ | ------------ |
| Reload tmux config | `<prefix> r` |
| Command mode       | `<prefix> :` |
| Show keybindings   | `<prefix> ?` |
| Show pane numbers  | `<prefix> q` |

## Essentials

```text id="sfvmdd"
Ctrl-a              Prefix

Ctrl-a |            Split left/right
Ctrl-a -            Split top/bottom

Ctrl-h/j/k/l        Navigate
Ctrl-a h/j/k/l      Resize
Ctrl-a m            Zoom

Ctrl-a c            New window
Ctrl-a 1-9          Switch window
Ctrl-a ,            Rename window

Ctrl-a [            Scroll/copy mode
Ctrl-a d            Detach
Ctrl-a r            Reload config
```
