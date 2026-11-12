class Kit < Formula
  desc "Your Claude Code sessions on your iPhone, straight from this Mac"
  homepage "https://github.com/koso-koso/homebrew-kit"
  url "https://github.com/koso-koso/homebrew-kit/releases/download/v0.1.2/kit-0.1.2-macos-arm64.tar.gz"
  version "0.1.2"
  sha256 "960257e92779dae8386e93c9b6942b84fe35948e9f0d21721c170940d0858606"
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
      iPhone. kit keeps itself up to date (brew upgrade, in the background).
    EOS
  end

  test do
    assert_match "kit #{version}", shell_output("#{bin}/kit --version")
  end
end
