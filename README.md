# Homebrew tap for Termhint

[Termhint](https://termhint.com): autocomplete, prompt themes, terminal colors and runtime versions for macOS terminals.

```sh
brew install --cask toni1703/termhint/termhint
```

Termhint updates itself (Sparkle); `brew upgrade --cask termhint` also works.

To remove it, first undo what it changed outside its own folders, then uninstall:

```sh
termhint uninstall --all
brew uninstall --cask termhint        # --zap also removes its caches and preferences
```

`Casks/termhint.rb` is written by Termhint's release script on every release. Don't edit it here.
