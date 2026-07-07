class Chronikl < Formula
  desc "AI-powered release notes generator"
  homepage "https://chronikl.dev"
  license "BUSL-1.1"
  version "1.2.1" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-apple-darwin.tar.gz"
      sha256 "75f61bc2fb01536dd6b08b1cbe458e6fb5971a60c007e97b2fdff35e9fd0d009" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-apple-darwin.tar.gz"
      sha256 "0b29fcd21a455c3a9ddeab97803383173a6fe70d1c1ecfb731eed28da6a1b845"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b50693a07401de8243779447a901cb14641d7e18b69e774f7ff1618f5f14809"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "968e7f4564e20b764f3a499dc96b4de498146ef3145665d91349fd4571a15068"
    end
  end

  def install
    bin.install "chronikl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronikl --version")
  end
end
