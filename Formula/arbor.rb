class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/v0.1.0/arbor_0.1.0_darwin_arm64.tar.gz"
      sha256 "635dab3d864de98a9a1a82c29fa9c8ccb21c14cbec59752e2e3548fffe8a4982"
    else
      url "https://github.com/gcstools/arbor/releases/download/v0.1.0/arbor_0.1.0_darwin_amd64.tar.gz"
      sha256 "c43ad7f0c602e52a84e40831351335ded53821afd0208430eea2b1ac99e6fae7"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/v0.1.0/arbor_0.1.0_linux_amd64.tar.gz"
    sha256 "42168cd598bf11fb8f9ef6c0e4eec6161f13ce2e1a2cbefce55eb9949f8a1184"
  end

  def install
    bin.install "arbor"
    bash_completion.install "completions/arbor.bash" => "arbor" if Dir.exist?("completions")
    zsh_completion.install "completions/_arbor" if Dir.exist?("completions")
    fish_completion.install "completions/arbor.fish" if Dir.exist?("completions")
  end

  test do
    assert_match "Manage Git worktree setup workflows.", shell_output("#{bin}/arbor --help")
  end
end
