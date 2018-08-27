From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 27
Date: Mon, 27 Aug 2018 11:00:38 +1000
Message-ID: <20180827110038.2800ce18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M.Dft36Zq7RS0arIwr2QkgC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/M.Dft36Zq7RS0arIwr2QkgC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20180824:

Dropped trees: xarray, ida (temporarily)

Non-merge commits (relative to Linus' tree): 427
 585 files changed, 17988 insertions(+), 5276 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 287 trees (counting Linus' and 65 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

--Sig_/M.Dft36Zq7RS0arIwr2QkgC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluDTTYACgkQAVBC80lX
0GyESwf/cDHOAZc+1nTycCzjdQtGv1poHfwHcQvkiTx78ACQCf0s57TIbj/HZmXO
Lt9CTB+gc+vZMui1q/zxFDIWCS15RjWVkiLheOwFgnUTsP7yc5CpCjWBmGWW2Szg
D7oy6lCxs7u2KYnq6bHeO1DmSSphHa1eD4MDFeXSDuzCkYtp1Spz7SG4uFBivq0J
6CzIOT+XQH+iRQfJ4N9R1GSkE5KRuFLgpaZRMknpxsUUec03yoTPMqvHDfM24j79
WCk25ubNURW6aEP9wiEh/sDabSwETe1/uMi95CBuf2tnNCnZwbvEQSNujSAl2c8C
tZT2dEHjmDW4gOxN31p0pzM4P3F/xQ==
=SV7X
-----END PGP SIGNATURE-----

--Sig_/M.Dft36Zq7RS0arIwr2QkgC--
