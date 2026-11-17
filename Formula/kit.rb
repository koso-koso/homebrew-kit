class Kit < Formula
  desc "Your Claude Code sessions on your iPhone, straight from this Mac"
  homepage "https://github.com/koso-koso/homebrew-kit"
  url "https://github.com/koso-koso/homebrew-kit/releases/download/v0.1.13/kit-0.1.13-macos-arm64.tar.gz"
  version "0.1.13"
  sha256 "6b610556e228f59ca88259c378dc5278f54527a1e08c062cb01200cdeed48016"
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
