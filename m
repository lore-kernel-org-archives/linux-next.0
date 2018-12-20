From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 asm-generic tree
Date: Thu, 20 Dec 2018 18:44:03 +1100
Message-ID: <20181220184403.464d0e3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NUFyURPUj4tlatfFTLUZIz/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Firoz Khan <firoz.khan@linaro.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NUFyURPUj4tlatfFTLUZIz/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/sh/include/asm/Kbuild

between commit:

  2b3c5a99d5f3 ("sh: generate uapi header and syscall table header files")

from the asm-generic tree and commit:

  548211e87ba0 ("sh: include: convert to SPDX identifiers")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/sh/include/asm/Kbuild
index b15caf34813a,f4440779deab..000000000000
--- a/arch/sh/include/asm/Kbuild
+++ b/arch/sh/include/asm/Kbuild
@@@ -1,4 -1,4 +1,5 @@@
+ # SPDX-License-Identifier: GPL-2.0
 +generated-y +=3D syscall_table.h
  generic-y +=3D compat.h
  generic-y +=3D current.h
  generic-y +=3D delay.h

--Sig_/NUFyURPUj4tlatfFTLUZIz/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwbSEMACgkQAVBC80lX
0GzShgf/T5RSzdQNcTuGZpLDZGkVG3MNj9Lnc4z13HYouxP0cYXzajshfVvDlfpH
TSgF59k8IX46bq9IH5xWn4/1/XczeThCqR8M7pUq/lFMWCDGuRRi+oBdy92yNLZV
mtQ0si2Lgc7e0/JXrHAjKzBhZ2WZiS9MYYG73mQoM3TWsfRSBTt+X1Hq+hei7LAk
UNWiOQcVSWJXMWpfcB4DmtuSjiQUezc70JURrG7mXfnv5LmLeuyHg9G2goXaIr11
letF/r+8Ycc5V1lT1DHjkEchojVAuXTaPmqpxTb3KUDRjktSe5S2ACdI94M4EX6u
crer9eRdWMs7M5qqWl4q7eYBgVRj+w==
=Vhyn
-----END PGP SIGNATURE-----

--Sig_/NUFyURPUj4tlatfFTLUZIz/--
