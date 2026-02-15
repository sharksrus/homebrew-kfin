class Kfin < Formula
  desc "Kubernetes cost visibility CLI"
  homepage "https://github.com/sharksrus/kfin"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.2/kfin_darwin_arm64.tar.gz"
      sha256 "50bde8978b81aab65b9c01fc71ada371c294e940c70661ff4de8f836a3072dca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.2/kfin_linux_amd64.tar.gz"
      sha256 "aedae0012ff762240aa3750d7aa2d461eb12457d84187153df353e81b24f7fbd"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.2/kfin_linux_arm64.tar.gz"
      sha256 "d3cd9cba8b8a1b09a2e00391977ccd9a53a042c8ea0279ab572f74373ac922b3"
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
