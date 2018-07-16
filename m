From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 16
Date: Mon, 16 Jul 2018 17:56:07 +1000
Message-ID: <20180716175607.66099a5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FKS3XK1H8Uv.3a0NTAZfCtd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/FKS3XK1H8Uv.3a0NTAZfCtd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20180713:

The arm-soc tree gained a build failure so I used the version from
next-20180713.

Non-merge commits (relative to Linus' tree): 6029
 5901 files changed, 216652 insertions(+), 121372 deletions(-)

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

I am currently merging 283 trees (counting Linus' and 65 trees of bug
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

--Sig_/FKS3XK1H8Uv.3a0NTAZfCtd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltMT5cACgkQAVBC80lX
0GzLiwgApCVFePPQyCCuY8PHZlwQB1tY5HiyvHDJGqdk7SgBJN49TQDbWGB6aJy7
ACLznX8IGPNwqFNhD2hj9uOhPrpJFGkAim1YeFYmdaGhAkTp3x8QvqLJxLGl3qYp
CmXANRq5mE0MRha+pq+LfyZf6a/Z8BRGWXlN4ws/+g9ugcZ2y1wS5UEy7UK7ybqr
oaRISl+crSI2Axd+tDMqGlYLpJowhr7iJywGbFSlwgUTqErgxsMER71M/IF7GY6D
vXFBxGYPXIrVwmGIJ20mcKEtiBZytw4rpadNLeH9txqz5yBb3cnPU5kLrJRewmiG
cvQ8E2F4BKxwBjZfj8yDx5hfk9uwbQ==
=+lIO
-----END PGP SIGNATURE-----

--Sig_/FKS3XK1H8Uv.3a0NTAZfCtd--
