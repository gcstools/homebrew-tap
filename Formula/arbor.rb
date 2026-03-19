class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "arbor-v0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.0/arbor_arbor-v0.2.0_darwin_arm64.tar.gz"
      sha256 "7459bcbcb637bfc3a5d19235bbe5225b00d8fbc6e9467097c6e0a190f7244589"
    else
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.0/arbor_arbor-v0.2.0_darwin_amd64.tar.gz"
      sha256 "7b6e4eab05a837879f8ada13e968822eb706e27c9c97bab9b0a7da75e33bc74a"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/arbor-v0.2.0/arbor_arbor-v0.2.0_linux_amd64.tar.gz"
    sha256 "8cdc5acc35ae35085417ae8925f91325b7741e165aabb94b5b43e42072de0d94"
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
