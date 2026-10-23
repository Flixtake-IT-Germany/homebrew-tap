# Homebrew-Formel (Cask) für ClipFix im Tap von Flixtake (Flixtake-IT-Germany/homebrew-tap).
# Installation: brew install --cask flixtake-it-germany/tap/clipfix
# Version und sha256 setzt das Skript für Veröffentlichungen, die Dateien liegen auf clipfix.flixtake.app.
# Über Homebrew aktualisiert brew upgrade; ClipFix erkennt das an seinem Ordner im Caskroom und sucht dann
# nicht selbst nach Updates.
cask "clipfix" do
  version "0.1.4"
  sha256 "fc3661ae6788a8b8e9e6864b7369c6dc0beb615c8cb5205179d2ce1d44c0b663"

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
