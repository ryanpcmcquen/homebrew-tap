class Flint < Formula
  desc "Morning standup brief and AI session manager"
  homepage "https://github.com/ryanpcmcquen/flint"
  url "https://github.com/ryanpcmcquen/flint/archive/refs/tags/0.5.0.tar.gz"
  sha256 "d8332a870761e1e86b07f4eca6b550af83a576ac1349e4df4392979ac19b1549"
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
