cask "devmachine-app" do
  version "0.10.0"
  sha256 "bb8449eda21b0c75e94811b9536833f50edb98aced0dfd964674b9cef149a49f"

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
