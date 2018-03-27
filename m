From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the asm-generic tree with the kbuild
 tree
Date: Wed, 28 Mar 2018 09:02:22 +1100
Message-ID: <20180328090222.0f3c34da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//QhUNAk4SqR+7IFcMV3udDS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <jhogan@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//QhUNAk4SqR+7IFcMV3udDS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the asm-generic tree got a conflict in:

  arch/metag/boot/dts/Makefile

between commit:

  b985b71d295f ("kbuild: mark $(targets) as .SECONDARY and remove .PRECIOUS=
 markers")

from the kbuild tree and commit:

  bb6fb6dfcc17 ("metag: Remove arch/metag/")

from the asm-generic tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_//QhUNAk4SqR+7IFcMV3udDS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq6v24ACgkQAVBC80lX
0Gw/VQf/TNvKlcI+j0uJ/vEMgGzy7j0oc462k0SmWQPs5vhPrFcGl5Dwk/mrAReg
XXK1xbI3Yxg1DvmrJquXh9g8z/U2PkJNgZ0C0MG5Kki/T7ZKyqgaOvH/QrgcHB1h
GN7VClrG25fDh6/u03shkMx5yccFmagzzLHi+Y5Ir7XCw/4hVy8EpWshaxdel6ze
2pziRnkqTp0ZU+ZQhMura10pKQZvshPTllY+euugHB//l7Ia2oCDJzPP8aZpO6Xi
psiMpLZrZmt9CPg0VhoRvfs/h3lJg43guY4TApqPys0xld0c3NOGmAmBTXFLv8mr
f47vlVaSKHmVKFUx/ly8KK7dMsv0Aw==
=4lXp
-----END PGP SIGNATURE-----

--Sig_//QhUNAk4SqR+7IFcMV3udDS--
