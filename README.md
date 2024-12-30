# fish-alias-search
A tiny Fish shell plugin to search aliases and abbreviations

## Installation

Use your favourite package manager, I will use [fisher](https://github.com/jorgebucaran/fisher)

```sh
fisher install 'kieo-ch/fish-alias-search'
```

## Usage

**Listing/searching abbreviations and aliases**
```sh
als     # lists all aliases & abbreviations
als git # searches for aliases & abbreviations containing 'git'
```

The search is done on both the trigger word & the resulting command, meaning it should reliably find your alias if you know bits of one or the other.

**Adding abbreviations**
```sh
add-abbr vf 'vim ~/.config/fish/config.fish' # permanently adds the abbreviation
```

**Removing abbreviations**
```sh
remove-abbr vf # permanently removes the abbreviation
```

