class Yosys < Formula
  desc "Framework for Verilog RTL synthesis"
  homepage "http://www.clifford.at/yosys/"
  url "https://github.com/cliffordwolf/yosys/archive/yosys-0.8.tar.gz"
  sha256 "07760fe732003585b26d97f9e02bcddf242ff7fc33dbd415446ac7c70e85c66f"

  # TODO: Why does Brewfile have very different dependencies than formula?
  depends_on "bison" => :build
  depends_on "pkg-config" => :build
  depends_on "libffi"
  depends_on "python3"
  depends_on "readline"
  depends_on "flex"
  depends_on "gawk"
  depends_on "git"
  depends_on "graphviz"
  depends_on "pkg-config"

  # This ABC revision is specified in the makefile.
  # The makefile by default checks it out using git,
  # but this recipe instead downloads a tar.gz archive.
  resource "abc" do
    url "https://github.com/berkeley-abc/abc/archive/ae6716b064c842f45109a88e84dca71fe4cc311f.zip"
    sha256 "7815774cc91080822435639b66d9516ce2b3e6a02acb3e0bf9eb8c57349f9e24"
  end

  # Patch integrated upstream

  def install
    resource("abc").stage buildpath/"abc"
    system "make", "install", "PREFIX=#{prefix}", "PRETTY=0", "ABCREV=default"
  end

  test do
    system "#{bin}/yosys", "-p", "hierarchy; proc; opt; techmap; opt;", "-o", "synth.v", "#{pkgshare}/adff2dff.v"
  end
end
