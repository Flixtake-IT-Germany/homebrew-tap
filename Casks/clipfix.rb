# Homebrew-Formel (Cask) für ClipFix im Tap von Flixtake (Flixtake-IT-Germany/homebrew-tap).
# Installation: brew install --cask flixtake-it-germany/tap/clipfix
# Version und sha256 setzt das Skript für Veröffentlichungen, die Dateien liegen auf clipfix.flixtake.app.
# Über Homebrew aktualisiert brew upgrade; ClipFix erkennt das an seinem Ordner im Caskroom und sucht dann
# nicht selbst nach Updates.
cask "clipfix" do
  version "0.1.3"
  sha256 "9bcd6b548ab88f31da2cf92b9eb16238c255c8afa7f6de58425787f6ec0f9df9"

  url "https://clipfix.flixtake.app/download/ClipFix-#{version}-arm64.dmg"
  name "ClipFix"
  desc "Check video clips for frame errors and repair them"
  homepage "https://flixtake.com/clipfix"

  livecheck do
    url "https://clipfix.flixtake.app/updates/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "ClipFix.app"

  zap trash: [
    "~/Library/Application Support/ClipFix",
    "~/Library/Caches/com.flixtake.clipfix",
    "~/Library/Caches/com.flixtake.clipfix.ShipIt",
    "~/Library/Preferences/com.flixtake.clipfix.plist",
    "~/Library/Saved Application State/com.flixtake.clipfix.savedState",
  ]
end
