class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.1/arbor_0.4.1_darwin_arm64.tar.gz"
      sha256 "71bdc511fc60499bf13da9f1900926d37d3f18eb0c161670a185d990d9a11c8a"
    else
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.1/arbor_0.4.1_darwin_amd64.tar.gz"
      sha256 "6e40edc966c42cacbef2ae5dec7ce5db89989b3e96e31140b30440fc1e2c8d49"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.1/arbor_0.4.1_linux_amd64.tar.gz"
    sha256 "c9afdb4a56efdb3d718c7cd469b906f68d8e7012a412f4abc66a46da05140ab3"
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
