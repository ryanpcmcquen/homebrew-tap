class FlintAi < Formula
  desc "Morning standup brief and AI session manager"
  homepage "https://github.com/ryanpcmcquen/flint"
  url "https://github.com/ryanpcmcquen/flint/archive/refs/tags/0.7.1.tar.gz"
  sha256 "047aec6324c1ffe5a3eafb2450935f5805c595dc0ff5791fc9bec3e1e2464f86"
  license "ISC"
  head "https://github.com/ryanpcmcquen/flint.git", branch: "main"

  depends_on "make" => :build

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install "flint"
    man1.install "man/flint.1"
  end

  test do
    assert_match "Flint version #{version}", shell_output("#{bin}/flint --version")
  end
end
