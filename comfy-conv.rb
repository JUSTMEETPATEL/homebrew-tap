# Homebrew Formula for comfy-conv
# 
# To test locally:
#   brew install --build-from-source ./Formula/comfy-conv.rb
#
# To publish:
#   1. Create a tap: https://github.com/JUSTMEETPATEL/homebrew-tap
#   2. Add this formula to the tap
#   3. Users can then: brew install justmeetpatel/tap/comfy-conv

class ComfyConv < Formula
  desc "Interactive CLI document converter with a beautiful TUI"
  homepage "https://github.com/JUSTMEETPATEL/Comfy-Conv"
  url "https://github.com/JUSTMEETPATEL/Comfy-Conv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "rust" => :build
  depends_on "pandoc"
  
  # LibreOffice is a cask dependency
  cask "libreoffice"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      comfy-conv requires LibreOffice and Pandoc for conversions.
      
      LibreOffice should have been installed automatically.
      If not, run: brew install --cask libreoffice
      
      Pandoc should have been installed automatically.
      If not, run: brew install pandoc
    EOS
  end

  test do
    assert_match "comfy-conv", shell_output("#{bin}/comfy-conv --version")
  end
end
