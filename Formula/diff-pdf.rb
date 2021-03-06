class DiffPdf < Formula
  desc "Visually compare two PDF files"
  homepage "https://vslavik.github.io/diff-pdf/"
  url "https://github.com/vslavik/diff-pdf/archive/v0.2.tar.gz"
  sha256 "cb90f2e0fd4bc3fe235111f982bc20455a1d6bc13f4219babcba6bd60c1fe466"
  revision 23

  bottle do
    cellar :any
    sha256 "051b1b7b36cb2450a60aef7e39aedae0f707ef54b9ac65d129ab56015cf0970c" => :high_sierra
    sha256 "092bfc1e6e180c0b99de02e95ff23d5542b75f2857cb86f068359bd93693bb90" => :sierra
    sha256 "2638f59d4650f73ef5040afb4cf197072df396a163535d41e068ae70889b20fc" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on :x11
  depends_on "wxmac"
  depends_on "cairo"
  depends_on "poppler"

  def install
    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/diff-pdf", "-h"
  end
end
