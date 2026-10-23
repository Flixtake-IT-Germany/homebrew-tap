# Homebrew-Formel (Cask) für ClipFix, für ein eigenes Tap von Flixtake (Flixtake-IT-Germany/homebrew-tap).
# Installation: brew install --cask flixtake-it-germany/tap/clipfix
# Version und sha256 setzt das Skript für Veröffentlichungen, die Dateien liegen auf clipfix.flixtake.app.
#
# Über Homebrew sind Suche und Installieren von Updates in ClipFix ab Werk aus, Homebrew aktualisiert mit
# brew upgrade. Damit ClipFix das erkennt, setzt postflight InstallSource=homebrew in den Einstellungen der App.
# Wählt jemand in ClipFix selbst, gilt diese Wahl.
cask "clipfix" do
  version "0.1.0"
  sha256 "95b78e9255aafcebee95b0d9a66051d5c165708ec8fd757f30ec8a601c3373f8"

  url "https://clipfix.flixtake.app/download/ClipFix-#{version}-arm64.dmg"
  name "ClipFix"
  desc "Check video clips for frame errors and repair them"
  homepage "https://flixtake.com/clipfix"

  livecheck do
    url "https://clipfix.flixtake.app/updates/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "ClipFix.app"

  postflight do
    system_command "/usr/bin/defaults",
                   args: ["write", "com.flixtake.clipfix", "InstallSource", "-string", "homebrew"]
  end

  uninstall_postflight do
    system_command "/usr/bin/defaults",
                   args: ["delete", "com.flixtake.clipfix", "InstallSource"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/ClipFix",
    "~/Library/Caches/com.flixtake.clipfix",
    "~/Library/Caches/com.flixtake.clipfix.ShipIt",
    "~/Library/Preferences/com.flixtake.clipfix.plist",
    "~/Library/Saved Application State/com.flixtake.clipfix.savedState",
  ]
end
