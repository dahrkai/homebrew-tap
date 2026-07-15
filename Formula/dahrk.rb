# Homebrew formula for the Dahrk edge client.
#
# This is the CANONICAL SOURCE for the formula. It is mirrored into the tap repo
# github.com/dahrkai/homebrew-tap as Formula/dahrk.rb, where `brew install dahrkai/tap/dahrk` reads
# it. The release workflow (.github/workflows/release.yml) rewrites `url`/`sha256` for the published
# version and pushes the update to the tap on every tagged release; keep this copy in step for the
# manual bootstrap of the very first release.
#
# The npm package is `dahrk-node`; the binary/command it installs is `dahrk`.
class Dahrk < Formula
  desc "Dahrk edge client: run a self-managed node that executes Dahrk workflow stages"
  homepage "https://dahrk.ai"
  url "https://registry.npmjs.org/dahrk-node/-/dahrk-node-0.1.19.tgz"
  sha256 "56241dd6a0e4a1b620a8facdfeca9ea9fd9a40d6875f04b6b806a37d7665fcfd"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dahrk --version")
  end
end
