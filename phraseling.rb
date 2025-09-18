class Phraseling < Formula
  desc "Transform text with local AI - Private, Fast, Free"
  homepage "https://github.com/palyam/phraseling"
  url "https://github.com/palyam/phraseling/releases/download/v1.0.0/phraseling-1.0.0.tar.gz"
  sha256 "0a7d708753ad2cd351e616b21ed168d239b5d804a1c8a861fb7dce5573f1bb4c"
  license "MIT"
  version "1.0.0"

  depends_on "ollama"

  def install
    bin.install "bin/phraseling"

    # Install shortcut template
    pkgshare.install "shortcuts/Phraseling.shortcut"

    # Install documentation
    doc.install "README.md"
  end

  def post_install
    puts ""
    puts "✨ Phraseling installed successfully!"
    puts ""
    puts "📋 Next steps:"
    puts "1. Install a language model:"
    puts "   ollama pull gpt-oss:latest"
    puts ""
    puts "2. Import Mac shortcut:"
    puts "   open #{pkgshare}/Phraseling.shortcut"
    puts ""
    puts "3. Test the tool:"
    puts "   phraseling \"hello world\""
    puts ""
    puts "📖 Documentation: phraseling --help"
    puts "🔧 Configuration: phraseling --config"
    puts ""
  end

  test do
    # Test that the binary exists and shows help
    assert_match "Phraseling v#{version}", shell_output("#{bin}/phraseling --version")
    assert_match "Transform text with local AI", shell_output("#{bin}/phraseling --help")
  end
end