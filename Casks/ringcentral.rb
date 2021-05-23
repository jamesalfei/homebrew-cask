cask "ringcentral" do
  version "21.1.29"
  sha256 :no_check

  url "https://app.ringcentral.com/downloads/RingCentral.pkg"
  name "RingCentral"
  homepage "https://www.ringcentral.com/rcapp.html"

  livecheck do
    url "https://app.ringcentral.com/download/latest-mac.yml"
    strategy :electron_builder
  end

  pkg "RingCentral.pkg"

  uninstall delete:  "/Applications/RingCentral.app",
            quit:    "RingCentral",
            pkgutil: "com.ringcentral.glip"

  zap trash: [
    "~/Library/Application Support/RingCentral",
    "~/Library/Logs/RingCentral",
    "~/Library/Preferences/com.ringcentral.glip.plist",
    "~/Library/Saved Application State/com.ringcentral.glip.savedState",
  ]
end
