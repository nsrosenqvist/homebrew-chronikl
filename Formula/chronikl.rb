class Chronikl < Formula
  desc "AI-powered release notes generator"
  homepage "https://chronikl.dev"
  license "BUSL-1.1"
  version "1.1.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-apple-darwin.tar.gz"
      sha256 "e1306582db9a200185678817e932461bb8063c71600d7c21f68155a744b90c6d" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-apple-darwin.tar.gz"
      sha256 "dfe099c894f7ef2dda9d2e4b94c2c49cc6c46865b67b51d6eb8bee62a6926b9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57a930e50e15954ad6efab4a6a5917d05640dc20fe9859fe826096ced0545f27"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8afe360f47be27cfa1563ccb90d1496272ed049683c3c7c34c1a2e6140f70096"
    end
  end

  def install
    bin.install "chronikl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronikl --version")
  end
end
