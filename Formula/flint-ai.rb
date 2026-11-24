class FlintAi < Formula
  desc "Morning standup brief and AI session manager"
  homepage "https://github.com/ryanpcmcquen/flint"
  url "https://github.com/ryanpcmcquen/flint/archive/refs/tags/0.6.0.tar.gz"
  sha256 "a31be4e0e8e36d161ce14e2f6bc40f3cb883091b988d37a5e7a2a09ecb6c6ca4"
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
