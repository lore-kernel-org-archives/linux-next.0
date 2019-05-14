From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 10:15:18 +1000
Message-ID: <20190514100910.6996d2f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GsNMvU2qEo9mMflr5OjEJ0k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Tyler Hicks <tyhicks@canonical.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/GsNMvU2qEo9mMflr5OjEJ0k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I don't know why this suddenly appeared after mergeing the ecryptfs tree
since nothin has changed in that tree for some time (and nothing in that
tree seems relevant).

After merging the ecryptfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

scripts/Makefile.modpost:112: target '.tmp_versions/asix.mod' doesn't match=
 the target pattern
scripts/Makefile.modpost:113: warning: overriding recipe for target '.tmp_v=
ersions/asix.mod'
scripts/Makefile.modpost:100: warning: ignoring old recipe for target '.tmp=
_versions/asix.mod'
scripts/Makefile.modpost:127: target '.tmp_versions/asix.mod' doesn't match=
 the target pattern
scripts/Makefile.modpost:128: warning: overriding recipe for target '.tmp_v=
ersions/asix.mod'
scripts/Makefile.modpost:113: warning: ignoring old recipe for target '.tmp=
_versions/asix.mod'
make[2]: Circular .tmp_versions/asix.mod <- __modpost dependency dropped.
Binary file .tmp_versions/asix.mod matches: No such file or directory
make[2]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
make[1]: *** [Makefile:1290: modules] Error 2

The only clue I can see is that asix.o gets built in two separate
directories (drivers/net/{phy,usb}).

I have the following files in the object directory:

./.tmp_versions/asix.mod
./drivers/net/usb/asix.ko
./drivers/net/usb/asix.mod.o
./drivers/net/usb/asix.o
./drivers/net/usb/asix_common.o
./drivers/net/usb/asix_devices.o
./drivers/net/usb/.asix.ko.cmd
./drivers/net/usb/.asix.mod.o.cmd
./drivers/net/usb/.asix.o.cmd
./drivers/net/usb/asix.mod.c
./drivers/net/usb/.asix_common.o.cmd
./drivers/net/usb/.asix_devices.o.cmd
./drivers/net/phy/asix.ko
./drivers/net/phy/asix.o
./drivers/net/phy/.asix.ko.cmd
./drivers/net/phy/.asix.mod.o.cmd
./drivers/net/phy/asix.mod.o
./drivers/net/phy/asix.mod.c
./drivers/net/phy/.asix.o.cmd

./.tmp_versions/asix.mod

Looks like this:

------------------------------------------
drivers/net/phy/asix.ko
drivers/net/phy/asix.o


------------------------------------------

What you can't see above are the 256 NUL bytes at the end of the file
(followed by a NL).

This is from a -j 80 build.  Surely there is a race condition here if the
file in .tmp_versions is only named for the base name of the module and
we have 2 modules with the same base name.

I removed that file and redid the build and it succeeded.

Mind you, I have no itdea why this file was begin rebuilt, the merge
only touched these files:

fs/ecryptfs/crypto.c
fs/ecryptfs/keystore.c

Puzzled ... :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/GsNMvU2qEo9mMflr5OjEJ0k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzaCJYACgkQAVBC80lX
0GwlwQf9Gj9wz73uyo5re6z+nQHohC1vGzloekz15OIqF5RmdKpSqIF99rFJYE2k
1O6LUj+zVLOPN2h6NBFMX7XHRw4I5h7IXPp7VVTiVcptnsalQ12Ehjv9N+tZaNII
PMX6oZdNDAG9GtwShSKuUGHLMiFVvhf1TNyDfmCSRT72KytN6/eYchSDkqGNOBUi
rSu2+4aytF6UE8WHcf7EUmG0kfoN3bUCsKvrQe3KyHyo+b9fcbI9Fsisv/rUuI6m
Q8NRE25pzrL49YFLiZG506gyUBsorBHdT1wp+Qo1A1MtHwI2439Zuv5el7QLSVll
jsaBXyrZvpJ/3dC6UFwJza/3vx1fag==
=Cwco
-----END PGP SIGNATURE-----

--Sig_/GsNMvU2qEo9mMflr5OjEJ0k--
