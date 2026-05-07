# typed: false
# frozen_string_literal: true

class Seedx < Formula
  desc "Coding agent harness CLI"
  homepage "https://github.com/iFurySt/seedx"
  url "https://registry.npmjs.org/@ifuryst/seedx/-/seedx-0.1.0.tgz"
  sha256 "0c95fda002e078c95b8c25cea6a1c5ce9ee57a21f4f3fc7f7d5717df7263f37c"
  version "0.1.0"
  license "MIT"

  def install
    platform =
      if OS.mac?
        Hardware::CPU.arm? ? "darwin-arm64" : "darwin-x64"
      elsif OS.linux?
        Hardware::CPU.arm? ? "linux-arm64" : "linux-x64"
      end

    odie "unsupported platform" if platform.nil?

    package_root = (buildpath/"package").directory? ? buildpath/"package" : buildpath
    bin.install package_root/"dist/#{platform}/seedx" => "seedx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seedx version 2>&1")
  end
end
