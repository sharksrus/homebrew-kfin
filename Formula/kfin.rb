class Kfin < Formula
  desc "Kubernetes cost visibility CLI"
  homepage "https://github.com/sharksrus/kfin"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.0/kfin_darwin_arm64.tar.gz"
      sha256 "c7f617989a077d3356ef9eba8c95a1bb9ad4be1cdeec29b0c4e751015ccde1f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.0/kfin_linux_amd64.tar.gz"
      sha256 "3dbde0de31d9400e57508a3c2ed687b43acccc2f38ecd0efdaac542462368080"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.1.0/kfin_linux_arm64.tar.gz"
      sha256 "2855636197f05d4e0152e2279053af1ee806c7135d5927f3c8ceee960e0cf6e8"
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
