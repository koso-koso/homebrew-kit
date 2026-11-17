class Kit < Formula
  desc "Your Claude Code sessions on your iPhone, straight from this Mac"
  homepage "https://github.com/koso-koso/homebrew-kit"
  url "https://github.com/koso-koso/homebrew-kit/releases/download/v0.1.12/kit-0.1.12-macos-arm64.tar.gz"
  version "0.1.12"
  sha256 "e75872e8825df68cb3516a478660aa4648fcb4372f982c274a555cd28f68a8cb"
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
