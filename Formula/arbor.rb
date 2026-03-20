class Arbor < Formula
  desc "Manage Git worktree setup workflows"
  homepage "https://github.com/gcstools/arbor"
  version "arbor-v0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.3.0/arbor_arbor-v0.3.0_darwin_arm64.tar.gz"
      sha256 "743cda37a866b6a3ed61f1372029aea186c42e277588f4b3bb04ab02368dbfc6"
    else
      url "https://github.com/gcstools/arbor/releases/download/arbor-v0.3.0/arbor_arbor-v0.3.0_darwin_amd64.tar.gz"
      sha256 "9253292f308dec20b1ab036b710173fc8023657016a475b818dd07cc98485c11"
    end
  end

  on_linux do
    url "https://github.com/gcstools/arbor/releases/download/arbor-v0.3.0/arbor_arbor-v0.3.0_linux_amd64.tar.gz"
    sha256 "b8bdbbe233a3d25d18989960aaa5362821a8db33f53319f20a35ae28c6ee5a60"
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
