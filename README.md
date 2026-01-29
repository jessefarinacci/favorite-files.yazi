# favorite-files.yazi

[Yazi](https://github.com/sxyazi/yazi) plugin for automatically selecting favorite files when entering a directory

<TBD: screenshot>

## Requirements

- [Yazi](https://github.com/sxyazi/yazi) v26.1.22+

## Installation

```bash
ya pkg add jessefarinacci/favorite-files
```

## Setup

Add this to your `init.lua`:

```lua
require("favorite-files"):setup({
  favorites_prepend = { "main.lua", "init.lua" }
})
```

## Configuration

This plugin has a configuration style similar to Yazi itself. Here is the full configuration:

- `favorites` override the default favorite files (`"README.html"`, `"README.md"`, `"README.txt"`, `"README"`)
- `favorites_append` sets the favorite files to select *AFTER* looking for `favorites`
- `favorites_prepend` sets the favorite files to select *BEFORE* looking for `favorites`

The first "favorite" file found is selected and the plugin releases control, if none are found the plugin has no effect.
