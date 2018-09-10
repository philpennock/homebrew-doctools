require 'formula'

class Sdop < Formula
  desc "Typesetting tool to convert a subset of DocBook XML to PostScript"
  homepage "http://people.ds.cam.ac.uk/ph10/"
  url "ftp://ftp.csx.cam.ac.uk/pub/software/wordprocessing/unix/sdop/sdop-0.81.tar.bz2"
  version "0.81"
  sha256 "93fcea96b632f3975b6002bd845a99dd08fe836c5ea8d569c218e8898c3e16e1"
  # Checksum as retrieved 2018-09-09

  depends_on "jpeg"
  depends_on "libpng"

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
    system "sdop", "--version"
  end
end
