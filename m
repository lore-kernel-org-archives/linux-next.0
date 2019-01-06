From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the csky tree with Linus' tree
Date: Mon, 7 Jan 2019 10:27:27 +1100
Message-ID: <20190107102727.0c67e3d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.Zc9CJH194ceCFRxm77Z9+b"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/.Zc9CJH194ceCFRxm77Z9+b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guo,

Today's linux-next merge of the csky tree got a conflict in:

  Documentation/features/io/sg-chain/arch-support.txt

between commit:

  7c703e54cc71 ("arch: switch the default on ARCH_HAS_SG_CHAIN")

from Linus' tree and commit:

  ee8972b1ab82 ("Documentation/features: Add csky kernel features")

from the csky tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

You want to add "select ARCH_NO_SG_CHAIN" to your Kconfig somewhere
(see the commit from Linus' tree above).

--=20
Cheers,
Stephen Rothwell

--Sig_/.Zc9CJH194ceCFRxm77Z9+b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwyjt8ACgkQAVBC80lX
0Gy09Qf9Fkilw44ICvIepYWbFbRsQgrY2aVSAQIn1CeOx4OmVagXgJhe47936KVq
udfZkFF8N1NzZKBx2b/vQGyMi0RHUZUXhyEKat3EywVhGdNsgdTqtiP1UaKzKKk9
WUUdhCxLeXY780ukdtDJn70y/M7thXwcQmTbWYpRSCvzjp8vlOQ1eOzup5Ek95ei
V79b9urfXilzPDOsgyDgyUO7ycyFc84V8JLKlenxruiJ1GNeAGhG83IvmLNJJ8cw
yfNUrEVLeGRtu0dJoF/sxaTXAinYf+rCFMOgCz3lKAnUDLSKwkFg03a+nSd4VhRC
EZcTiTpPKL0fjHaqGVz0Ed1l7dLDOA==
=wXDZ
-----END PGP SIGNATURE-----

--Sig_/.Zc9CJH194ceCFRxm77Z9+b--
