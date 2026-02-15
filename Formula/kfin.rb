class Kfin < Formula
  desc "Kubernetes cost visibility CLI"
  homepage "https://github.com/sharksrus/kfin"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.3/kfin_darwin_arm64.tar.gz"
      sha256 "ae097e529e898f9b3662538dc465a089749e892f00e7a421a656731b5a8ddb56"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.3/kfin_linux_amd64.tar.gz"
      sha256 "3496b0c765da816ed168f09df170e8451375943aabe5e054151b93f345b62ac1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/sharksrus/kfin/releases/download/v0.0.3/kfin_linux_arm64.tar.gz"
      sha256 "c6666162e9eec4d94e9d8209e3c287665d34414a1c02b7594e33c4ae96ee6f00"
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
