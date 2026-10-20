cask "devmachine-app" do
  version "0.7.4"
  sha256 "2bd4902be2778453bc52bbfae59969ec439edfdaf3c3c1904388399b0cce41c9"

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
