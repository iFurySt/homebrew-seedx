# typed: false
# frozen_string_literal: true

class Seedx < Formula
  desc "Coding agent harness CLI"
  homepage "https://github.com/iFurySt/seedx"
  url "https://github.com/iFurySt/seedx/releases/download/v0.2.0/ifuryst-seedx-0.2.0.tgz"
  sha256 "3bcf7db4b9d6ac431ddb7da51d9257f6c663b2da25b5d5f1e62aacb4d563e2cd"
  version "0.2.0"
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
