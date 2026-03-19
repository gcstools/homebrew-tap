class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "arbor-v0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.1/arbor_arbor-v0.2.1_darwin_arm64.tar.gz"
      sha256 "3705b9bcf337d8f2d0192cd5577af33faa23381dc3c360facb9bc4014ccaa203"
    else
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.1/arbor_arbor-v0.2.1_darwin_amd64.tar.gz"
      sha256 "81d61a029d225d19201b33f17bfddac1ba16527c06bcbfeee520f41234e2c13b"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.1/arbor_arbor-v0.2.1_linux_amd64.tar.gz"
    sha256 "53a5a40902bbc70c4251762bfd54110a190ee9b906dea1f7f7fa1a48bb8895fd"
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
