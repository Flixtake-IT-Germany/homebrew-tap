# Homebrew-Formel (Cask) für ClipFix im Tap von Flixtake (Flixtake-IT-Germany/homebrew-tap).
# Installation: brew install --cask flixtake-it-germany/tap/clipfix
# Version und sha256 setzt das Skript für Veröffentlichungen, die Dateien liegen auf clipfix.flixtake.app.
# Über Homebrew aktualisiert brew upgrade; ClipFix erkennt das an seinem Ordner im Caskroom und sucht dann
# nicht selbst nach Updates.
cask "clipfix" do
  version "0.1.2"
  sha256 "88088d8d6a88c39a504c9d0b1e3f352c170878d73ac8f90e94e0b036c359ff24"

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
