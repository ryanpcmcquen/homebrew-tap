class FlintAi < Formula
  desc "Morning standup brief and AI session manager"
  homepage "https://github.com/ryanpcmcquen/flint"
  url "https://github.com/ryanpcmcquen/flint/archive/refs/tags/0.5.1.tar.gz"
  sha256 "31c3818462207869083ab8d01b97107c708a8eb364763e48545228bfe3bcc5e2"
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
