# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require "language/node"

class Manta < Formula
  desc "Joyent Triton Object Storage (Manta) CLI"
  homepage "https://github.com/joyent/node-manta"
  url "https://registry.npmjs.org/manta/-/manta-5.2.1.tgz"
  sha256 "84a9b6aa3d106f1862346262ee1245f47f295c1fbd55f999e85bf1e000468f2a"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
    man1.install_symlink Dir["#{libexec}/man/man1/*"]
    bash_completion.install "share/manta.completion"
  end

  # test do
  #   output = shell_output("#{bin}/mls")
  #   assert_match /\ANAME  CURR  ACCOUNT  USER  URL$/, output
  # end
end
