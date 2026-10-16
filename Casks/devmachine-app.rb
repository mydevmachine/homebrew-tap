cask "devmachine-app" do
  version "0.7.3"
  sha256 "665e241ad90da6222f1af19d74bf6dc4301f06416196803e8421f665be019167"

  url "https://github.com/mydevmachine/app-releases/releases/download/v#{version}/Devmachine-#{version}.dmg"
  name "Devmachine"
  desc "Native macOS app for operating a devmachine VPS"
  homepage "https://mydevmachine.sh/app/"

  depends_on macos: :sonoma

  app "Devmachine.app"

  zap trash: [
    "~/Library/Application Support/Devmachine",
    "~/Library/Preferences/app.devmachine.mac.plist",
    "~/Library/Saved Application State/app.devmachine.mac.savedState",
  ]

  caveats <<~EOS
    Devmachine needs the devmachine CLI to operate a machine:
      brew install mydevmachine/tap/devmachine
  EOS
end
