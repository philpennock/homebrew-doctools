require 'formula'

class Xfpt < Formula
  desc "Convert xfpt markup into DocBook XML"
  homepage "http://people.ds.cam.ac.uk/ph10/"
  url "ftp://ftp.csx.cam.ac.uk/pub/software/wordprocessing/unix/xfpt/xfpt-0.10.tar.bz2"
  version "0.10"
  sha256 "513dd655750d0bd8439c1a77bcfdcd95d0282004d8325834742c2caa658f2656"
  # Checksum as retrieved 2018-09-09

  # Our problem is that for tests, brew only supports an entirely disconnected
  # test stage unconnected to the build stage.
  # Meanwhile sdop and xfpt both have `runtest` scripts inside the `testing`
  # sub-dir, which expects `../src/CMD` to be the built command.
  #
  # So we move the main tests into the build stage and just invoke
  # with --version for the tests
  #
  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    Dir.chdir "testing" do
      system "./runtest"
    end
    system "make", "install"
  end

  test do
    system "xfpt", "--version"
  end
end
