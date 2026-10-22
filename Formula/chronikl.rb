class Chronikl < Formula
  desc "AI-powered release notes generator"
  homepage "https://chronikl.dev"
  license "BUSL-1.1"
  version "1.3.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-apple-darwin.tar.gz"
      sha256 "037c880dd1f75f9a3ee5147bb8a4da86b04f3a7f99305e4d1f3dc0f3ca2c678f" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-apple-darwin.tar.gz"
      sha256 "b63b735931d2ea822f28066c5d77d3b73241f990ad9e18444effb64b7d2b97d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe47c2d55272c1e6be10dd810afbce97c6a15c1ee18d53ae0903cf8d7baee611"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df0e576c1871da993630c8d7500fb895fb9ce8f9cc69dbbd18ce6f4434471c22"
    end
  end

  def install
    bin.install "chronikl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronikl --version")
  end
end
