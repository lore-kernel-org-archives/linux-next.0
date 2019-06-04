From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nand tree with Linus' tree
Date: Tue, 4 Jun 2019 10:54:18 +1000
Message-ID: <20190604105418.58da18b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nVE9Xfja1ymcpznMa6jaV1r"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nVE9Xfja1ymcpznMa6jaV1r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nand tree got a conflict in:

  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt

between commit:

  a5f2246fb913 ("dt: bindings: mtd: replace references to nand.txt with nan=
d-controller.yaml")

from Linus' tree and commit:

  33cc5bd0b87a ("dt-bindings: mtd: brcmnand: Make nand-ecc-strength and nan=
d-ecc-step-size optional")

from the nand tree.

I fixed it up (the latter included the changes from the former, so I
just used that) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nVE9Xfja1ymcpznMa6jaV1r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1wToACgkQAVBC80lX
0GyL7gf+NmJyIgxpzBKZ26V9d83sLzSIb6qeJXc0Xmp0nDOznqTlqXboyJzSaGQ4
7P7DLWPqEzwizk7VCHgU6DD8bRy8fe1Z3yaXq0y+p3IxDH0m2JOP7JEg4V/Shn7M
PgmecUFYCXi+lNXB8GhMWWWarP7qDZQZc95wIC6aD3rR/XxU6IB69NJ64kTgMHGg
BvmEuOciX77oi2pE9hl+3rMwd+6YOYTMTStyeYEslRlLPcHYLhL0E7dyYhvZyRfP
J5KHz7R7aI8PTfoO6i9HEahe8iKS46G+zxayMNNFC3akz3kixyL0/hB1sUkXHtkB
2ORP1xhi/2eInXyquoAuJM9cYsQeMA==
=i+6a
-----END PGP SIGNATURE-----

--Sig_/nVE9Xfja1ymcpznMa6jaV1r--
