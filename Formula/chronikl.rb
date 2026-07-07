class Chronikl < Formula
  desc "AI-powered release notes generator"
  homepage "https://chronikl.dev"
  license "BUSL-1.1"
  version "1.2.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-apple-darwin.tar.gz"
      sha256 "11112d6f1dc7d7acf9150c45f4b9488829dddc0e703b087a6624811b9f86c3f0" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-apple-darwin.tar.gz"
      sha256 "926e625793a66931dcdb54001b1efba6b6ee61df5b7c61cda3993b6999c04d07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6283d50e1eca87d2fd44788a3c1cb83efd17ca102bd43ac603b512376af95540"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/chronikl/releases/download/v#{version}/chronikl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d094b0a77eea67fae99999a65ce40e1c58db2f7c8f69091b6d32f551af26a13"
    end
  end

  def install
    bin.install "chronikl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronikl --version")
  end
end
