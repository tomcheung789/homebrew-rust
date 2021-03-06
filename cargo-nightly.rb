require 'formula'
require 'date'

class CargoNightly < Formula
  homepage 'http://crates.io'
  url 'https://github.com/rust-lang/cargo/archive/master.tar.gz'
  head 'https://github.com/rust-lang/cargo.git'
  version Date.today.to_s

  depends_on 'rust-nightly'
  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build

  def install
    args = ["--prefix=#{prefix}"]
    system "./configure", *args
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/cargo"
  end
end
