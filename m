From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the dma-mapping
 tree
Date: Fri, 22 Feb 2019 09:27:56 +1100
Message-ID: <20190222092756.242ea484@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xSTNhqAJGIWR29=5si.DuMS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/xSTNhqAJGIWR29=5si.DuMS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/kernel/dma.c

between commit:

  cfced786969c ("dma-mapping: remove the default map_resource implementatio=
n")

from the dma-mapping tree and commit:

  68005b67d15a ("powerpc/dma: use the generic direct mapping bypass")

from the powerpc tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/xSTNhqAJGIWR29=5si.DuMS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvJewACgkQAVBC80lX
0GxbmQf+NAs/oRsBxAr/Ipe9K32wdO4LWuYjEznzPv53Q8YaK5LpmSFM2xqcQGFX
8b1/POspGA5KmE4Ua8gNILZmF/h61Lu58nusKMdEg1ju7JwDUjCVcBDOcp0GHGbs
K6u2z7oLeUH4f/g6cVThWziMoKu/8FQOG/weCUbRDZtUpex0Vndt9niCc+59U/ZV
kUEernFXFCalXFFTBC+tayDLsh/819/Vq0jEcfZ81vPz7ObWC1Utw+6zerctw8hd
T6N9demZeNtV3SAN+ecnDxx3VmQOWZ/a3x97md86T/CDCGt0BK7hEfoQzwZHsa+f
b6UDZ33hX5Icsn9SAiAe5eew62doHg==
=d8NK
-----END PGP SIGNATURE-----

--Sig_/xSTNhqAJGIWR29=5si.DuMS--
