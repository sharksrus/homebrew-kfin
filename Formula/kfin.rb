class Kfin < Formula
  desc "Kubernetes cost visibility CLI"
  homepage "https://github.com/sharksrus/kfin"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.1/kfin_darwin_arm64.tar.gz"
      sha256 "1fc5fe795d76400e2ad980f92e0e3bee82ae3cbd9a04939f2a28e47bfd8a87b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.1/kfin_linux_amd64.tar.gz"
      sha256 "dc4ba2e198ff67719fe562eb53be9f62208c8aec3750f86737a19663968684ca"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.1/kfin_linux_arm64.tar.gz"
      sha256 "2c4cd0acd43ad6b301efa71019fe4f7580de0f89dcd86d48f856be129865aa83"
    end
  end

  def install
    bin.install "kfin"
  end

  test do
    output = shell_output("#{bin}/kfin --version")
    assert_match "kfin", output
  end
end
