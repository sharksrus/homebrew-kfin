class Kfin < Formula
  desc "Kubernetes cost visibility CLI"
  homepage "https://github.com/sharksrus/kfin"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.4/kfin_darwin_arm64.tar.gz"
      sha256 "3eef40b16b9f24892434b4460ffd066f307921c703a9aa639659a86a14e62f57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.4/kfin_linux_amd64.tar.gz"
      sha256 "193be86933e91e68f2605244089f03e68f77f7e91d059b98a299b7ae0a8f922a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.4/kfin_linux_arm64.tar.gz"
      sha256 "6afc3ac23e5878b783bd7e2d6b5054aae9b0f5cbcaa2b61609820077782c452d"
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
