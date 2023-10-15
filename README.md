# QuickOutput

## Quick retrieval of recent output history for screen reader users.

Allows reading of the 10 most recent lines of output by mapping them directly to keyboard keys.

## Installation

Run the following command in Mudlet:
```
lua uninstallPackage("QuickOutput");installPackage("https://github.com/ironcross32/QuickOutput-for-Mudlet/releases/latest/download/QuickOutput.mpackage")
```

## Usage

Hold the control key down, then tap a number from 1 to 0 on the number row. 1 is the most recent line, while 0 is the tenth most recent. Double-tapping the number of the line will cause its contents to be copied to your clipboard.

### Note
since this package binds keys to CTRL+&lt;number&gt;, it overrides Mudlet's default behavior of jumping to a particular tab. As this package is designed to run along side [ChannelHistory](https://github.com/ironcross32/ChannelHistory), which uses Alt+&lt;number&gt; for its most recent history per category, these keybindings cannot change. Thus, for those wishing to use these two packages in tandem, while preserving the ability to jump between multiple profiles, it will be necessary to change the following option within the, "Special Options" tab in preferences:
* Switch between input line and main window using:
F6 is recommended for users who wish to retain their ability to use tab auto-completion, however, tab may be a good choice for those who do not use it.
