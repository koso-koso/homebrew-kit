class Kit < Formula
  desc "Your Claude Code sessions on your iPhone, straight from this Mac"
  homepage "https://github.com/koso-koso/homebrew-kit"
  url "https://github.com/koso-koso/homebrew-kit/releases/download/v0.1.5/kit-0.1.5-macos-arm64.tar.gz"
  version "0.1.5"
  sha256 "c0deae4d9a99740f159069fde0eef71747ce24b68a99491f3b48c89cc7dab3bb"
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
