cask "devmachine-app" do
  version "0.3.0"
  sha256 "d65abfbac291958389cb7904698d152ddf9ba3c641f94964915d36b84612b2ad"

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
