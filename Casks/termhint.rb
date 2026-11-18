# The Homebrew cask, as `scripts/release.sh X.Y.Z --publish` writes it into the tap
# (github.com/toni1703/homebrew-termhint, Casks/termhint.rb) with 1.3.14 and ffd7d7515d5df3e344ea376a842a4aa8c45cdd4ebc6fb19f5655087b7b6e45f4 filled in.
cask "termhint" do
  version "1.3.14"
  sha256 "ffd7d7515d5df3e344ea376a842a4aa8c45cdd4ebc6fb19f5655087b7b6e45f4"

  url "https://downloads.termhint.com/Termhint-#{version}.dmg"
  name "Termhint"
  desc "Autocomplete, prompt themes, colors and language versions for any terminal"
  homepage "https://termhint.com/"

  livecheck do
    url "https://termhint.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Termhint.app"

  uninstall quit: "dev.termhint.Termhint"

  zap trash: [
    "~/.cache/termhint",
    "~/Library/Application Support/Termhint",
    "~/Library/Caches/dev.termhint.Termhint",
    "~/Library/HTTPStorages/dev.termhint.Termhint",
    "~/Library/Preferences/dev.termhint.Termhint.plist",
  ]

  caveats <<~EOS
    Termhint adds a block to ~/.zshrc (and ~/.bashrc if you chose bash) and may change your
    terminals' color and font settings. Before `brew uninstall --cask termhint`, run:
      termhint uninstall --all
    Installed language versions stay in ~/.local/share/termhint and settings in ~/.config/termhint.
  EOS
end
