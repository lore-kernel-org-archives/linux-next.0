From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the dma-mapping tree
Date: Tue, 2 Oct 2018 18:31:39 +1000
Message-ID: <20181002183139.64a85845@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/68h347dOdn6RQ5pEgHEID3R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/68h347dOdn6RQ5pEgHEID3R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/unicore32/Kconfig

between commit:

  b733116feab5 ("unicore32: remove swiotlb support")

from the dma-mapping tree and patch:

  "mm: remove CONFIG_HAVE_MEMBLOCK"

from the akpm tree.

I fixed it up (I forgot to generate the patch, sorry) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/68h347dOdn6RQ5pEgHEID3R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzLOsACgkQAVBC80lX
0GwzvQf/bzykubWZHEGoY2ho8RPwnlb/pWY4iM4niVbRlfvcQTRvSx7yPs/aCvOR
BC8835RkHkeA4ddnGM3hUaf24I4QZltSkJX+1S1VKByPKjEzXAL2DxnxEBSUVBzh
+54G6UbzDl7YhgemiTdSCtmToVuMUr4dg5+ypmnuxEgAZmvSpi3Tf7Bkfejl+au9
5S89h/ejbbORXCEXhphA2uDZRFZirYkGuC2P5Ia7B75JdCR5Ipy2wzo9MjCJbOrq
3/TYzQuZRC2wuN3/lKMp0a7LuYqwbR7gP4ny1HukndCuY4cfA8q+UmmuKnji9LrV
t0chM6WgkuF7qT6E/mxxOybbRLL6AA==
=c1ND
-----END PGP SIGNATURE-----

--Sig_/68h347dOdn6RQ5pEgHEID3R--
