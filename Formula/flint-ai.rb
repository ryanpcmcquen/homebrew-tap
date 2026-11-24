class FlintAi < Formula
  desc "Morning standup brief and AI session manager"
  homepage "https://github.com/ryanpcmcquen/flint"
  url "https://github.com/ryanpcmcquen/flint/archive/refs/tags/0.7.0.tar.gz"
  sha256 "4e449e05ebc9cce6d5ae5ce27de12d07bca27ebcf38f73c2831a6cd20c5309b2"
  license "ISC"
  head "https://github.com/ryanpcmcquen/flint.git", branch: "main"

  depends_on "make" => :build

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install "flint"
  end

  test do
    assert_match "Flint version #{version}", shell_output("#{bin}/flint --version")
  end
end
