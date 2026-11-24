class Kit < Formula
  desc "Your Claude Code sessions on your iPhone, straight from this Mac"
  homepage "https://github.com/koso-koso/homebrew-kit"
  url "https://github.com/koso-koso/homebrew-kit/releases/download/v0.1.17/kit-0.1.17-macos-arm64.tar.gz"
  version "0.1.17"
  sha256 "4aa116f42fd74785a42089b05c58a4c3c0431b9ad81b11d555e01b8616d5a8ef"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bin/kit"
    libexec.install "libexec/kit-net"
    (share/"kit").install "share/kit/web"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES"
  end

  def caveats
    <<~EOS
      Run kit: it opens the setup page, where you pair the kit app on your
      iPhone. When a new version is out, kit asks before updating.
    EOS
  end

  test do
    assert_match "kit #{version}", shell_output("#{bin}/kit --version")
  end
end
