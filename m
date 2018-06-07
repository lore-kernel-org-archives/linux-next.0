From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the tip tree
Date: Thu, 7 Jun 2018 14:19:04 +1000
Message-ID: <20180607141904.701b8061@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L3tyTh5XHWRzf_y1_xg_mtu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
List-Id: linux-next.vger.kernel.org

--Sig_/L3tyTh5XHWRzf_y1_xg_mtu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  kernel/Makefile

between commit:

  d7822b1e24f2 ("rseq: Introduce restartable sequences system call")

from the tip tree and commit:

  5981690ddb8f ("memremap: split devm_memremap_pages() and memremap() infra=
structure")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/Makefile
index 7085c841c413,9b9241361311..000000000000
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@@ -112,8 -112,8 +112,9 @@@ obj-$(CONFIG_JUMP_LABEL) +=3D jump_label.
  obj-$(CONFIG_CONTEXT_TRACKING) +=3D context_tracking.o
  obj-$(CONFIG_TORTURE_TEST) +=3D torture.o
 =20
- obj-$(CONFIG_HAS_IOMEM) +=3D memremap.o
+ obj-$(CONFIG_HAS_IOMEM) +=3D iomem.o
+ obj-$(CONFIG_ZONE_DEVICE) +=3D memremap.o
 +obj-$(CONFIG_RSEQ) +=3D rseq.o
 =20
  $(obj)/configs.o: $(obj)/config_data.h
 =20

--Sig_/L3tyTh5XHWRzf_y1_xg_mtu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsYsjgACgkQAVBC80lX
0GxCmAf/b/ylZzlwBAB6Cbvfg2NuRo4P2oWxKC6Se71d2MWfWJ30GwbKjs0AgshJ
RDhAVxbhysnCfWiiUhkXVPNiXcrL8jUTGdjRu8lEV3FRFUB/r+AwtmmPFTD4BlWC
0jqIs0rMyYFnPxHB3m/oPxHd4kltwq1yjrsMQbsF8qq8WR98EY8arjyXRc43//6s
t6pVHD+2q3kmcFrtJn8Qedj1MvoObvdEw8FEuzmlvIfs/cMSNthwP/GStnipQl+Y
FaTPkfOAMF2RZf9kZgqG+ICOkBfquCrI101tg5WiZSebO7L/qA2Hl8DjwRt8/oNj
rQ/ciEbxsRnSmAXlDSwVJSD+WOjenw==
=jRe3
-----END PGP SIGNATURE-----

--Sig_/L3tyTh5XHWRzf_y1_xg_mtu--
