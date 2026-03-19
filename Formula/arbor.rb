class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/v0.1.1/arbor_0.1.1_darwin_arm64.tar.gz"
      sha256 "f16ff4bf9a2c7d44538346ff33a2a704ad0f5a19a09cee309c6d00ccab7c265f"
    else
      url "https://github.com/gcstools/arbor/releases/download/v0.1.1/arbor_0.1.1_darwin_amd64.tar.gz"
      sha256 "aaded7341c0b4fcbefca73fcac9fa52f78cabbb2981849bfcf205d09402765d5"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/v0.1.1/arbor_0.1.1_linux_amd64.tar.gz"
    sha256 "9a365eb2c7462212eca7e7aab29d2b588a89777cb8aeb909ec456be49decddd7"
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
