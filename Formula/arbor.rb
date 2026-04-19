class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "arbor-v0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.0/arbor_arbor-v0.4.0_darwin_arm64.tar.gz"
      sha256 "40a563e2926f54c364a7337df29ac2d85f48bf53d761acf617c934d027411f5f"
    else
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.0/arbor_arbor-v0.4.0_darwin_amd64.tar.gz"
      sha256 "c373a2157ee65052c0257907efebecbaf76288c3ec2da64b562089ae35b4b2b6"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/arbor-v0.4.0/arbor_arbor-v0.4.0_linux_amd64.tar.gz"
    sha256 "0a16001dddffc326e1bfad72ac58cfff06f17d9652529bc2369bcf2f12b8f282"
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
