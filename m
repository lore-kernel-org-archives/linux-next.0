From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Date: Thu, 9 May 2019 10:44:09 +1000
Message-ID: <20190509104409.68446da2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y.FCpf7A_lHx=q1IALCGru4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Kitt <steve@sk2.org>, Ingo Molnar <mingo@kernel.org>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y.FCpf7A_lHx=q1IALCGru4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/x86/x86_64/mm.txt

between commit:

  89502a019790 ("x86/mm: Fix the 56-bit addresses memory map in Documentati=
on/x86/x86_64/mm.txt")

from Linus' tree and commit:

  b88679d2f2b9 ("Documentation: x86: convert x86_64/mm.txt to reST")

from the jc_docs tree.

I fixed it up (I deleted the file and added teh following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 May 2019 10:39:31 +1000
Subject: [PATCH] Documentation: x86: update for "x86/mm: Fix the 56-bit
 addresses memory map in Documentation/x86/x86_64/mm.txt"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/x86/x86_64/mm.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/x86/x86_64/mm.rst b/Documentation/x86/x86_64/mm.=
rst
index 52020577b8de..267fc4808945 100644
--- a/Documentation/x86/x86_64/mm.rst
+++ b/Documentation/x86/x86_64/mm.rst
@@ -78,7 +78,7 @@ Complete virtual memory map with 5-level page tables
 .. note::
=20
  - With 56-bit addresses, user-space memory gets expanded by a factor of 5=
12x,
-   from 0.125 PB to 64 PB. All kernel mappings shift down to the -64 PT st=
arting
+   from 0.125 PB to 64 PB. All kernel mappings shift down to the -64 PB st=
arting
    offset and many of the regions expand to support the much larger physic=
al
    memory supported.
=20
@@ -91,7 +91,7 @@ Complete virtual memory map with 5-level page tables
    0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-space=
 virtual memory, different per mm
   __________________|____________|__________________|_________|___________=
________________________________________________
                     |            |                  |         |
-   0000800000000000 |  +64    PB | ffff7fffffffffff | ~16K PB | ... huge, =
still almost 64 bits wide hole of non-canonical
+   0100000000000000 |  +64    PB | feffffffffffffff | ~16K PB | ... huge, =
still almost 64 bits wide hole of non-canonical
                     |            |                  |         |     virtua=
l memory addresses up to the -64 PB
                     |            |                  |         |     starti=
ng offset of kernel mappings.
   __________________|____________|__________________|_________|___________=
________________________________________________
@@ -107,7 +107,7 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused=
 hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual me=
mory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused=
 hole
-   ffdf000000000000 |   -8.25 PB | fffffdffffffffff |   ~8 PB | KASAN shad=
ow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 47-bit one from here on:
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/y.FCpf7A_lHx=q1IALCGru4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTd9kACgkQAVBC80lX
0GxfGAf7BBWJrE0RI4QacHN00po1z2E42QcpgQ+VqkgLIyMxjjU/CD+TUfalLoLR
gsOH1/U5jhxsltyf4V04CGoBCGHMK3557doSJDL9b8MGXLgtT4mAsPgT0twQ10TA
teYdpHvgdJNimsQCuuCc08Xj7cdGCQk9yQ4aOvQ1D6MjW9GtNkjSdJoSwthQlgtx
mvoeJc08tAi6lfz3Ggv+4S5/PsMjuVIOIrbqC97GNmjovHVRHg2eZYAgCbfaEbfU
9E5zknJHxT4alxlYql5SZd6hiP8WrLsuniHkqXhZC/1L17moV/y+ZfT9lDGfGCZi
Jixvn+LIsR4PSX2z4nVUCaixqRmN4w==
=MxAi
-----END PGP SIGNATURE-----

--Sig_/y.FCpf7A_lHx=q1IALCGru4--
