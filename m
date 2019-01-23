From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with Linus' tree
Date: Wed, 23 Jan 2019 13:41:57 +1100
Message-ID: <20190123134157.29c69b3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/msBv5YKQHsia=WBv1OUTT1I"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Christoph Hellwig <hch@lst.de>, Andy Duan <fugang.duan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/msBv5YKQHsia=WBv1OUTT1I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Today's linux-next merge of the slave-dma tree got a conflict in:

  drivers/dma/imx-sdma.c

between commit:

  750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()")

from Linus' tree and commit:

  ceaf52265148 ("dmaengine: imx-sdma: pass ->dev to dma_alloc_coherent() AP=
I")

from the slave-dma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/imx-sdma.c
index 86708fb9bda1,af14a8d6efa8..000000000000
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@@ -1182,8 -1189,8 +1189,8 @@@ static int sdma_request_channel0(struc
  {
  	int ret =3D -EBUSY;
 =20
- 	sdma->bd0 =3D dma_alloc_coherent(NULL, PAGE_SIZE, &sdma->bd0_phys,
 -	sdma->bd0 =3D dma_zalloc_coherent(sdma->dev, PAGE_SIZE, &sdma->bd0_phys,
 -					GFP_NOWAIT);
++	sdma->bd0 =3D dma_alloc_coherent(sdma->dev, PAGE_SIZE, &sdma->bd0_phys,
 +				       GFP_NOWAIT);
  	if (!sdma->bd0) {
  		ret =3D -ENOMEM;
  		goto out;
@@@ -1205,8 -1212,8 +1212,8 @@@ static int sdma_alloc_bd(struct sdma_de
  	u32 bd_size =3D desc->num_bd * sizeof(struct sdma_buffer_descriptor);
  	int ret =3D 0;
 =20
- 	desc->bd =3D dma_alloc_coherent(NULL, bd_size, &desc->bd_phys,
- 				      GFP_NOWAIT);
 -	desc->bd =3D dma_zalloc_coherent(desc->sdmac->sdma->dev, bd_size,
 -				       &desc->bd_phys, GFP_NOWAIT);
++	desc->bd =3D dma_alloc_coherent(desc->sdmac->sdma->dev, bd_size,
++				      &desc->bd_phys, GFP_NOWAIT);
  	if (!desc->bd) {
  		ret =3D -ENOMEM;
  		goto out;

--Sig_/msBv5YKQHsia=WBv1OUTT1I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxH1HUACgkQAVBC80lX
0GznDQgAhP4eSUOMArUCWUJt1zJ7xaqmfn/BElyVcjKPB6GD3skB/zQngpQylLfQ
jmRzTBOaQnWhRhHkzZ/MhkoDB5EUsKZl2L701n8qP6vA1JxPKnX3ruOajgOwDP5j
f+sRSd8hGFl3+ajBfMh646rEg2fQePtD6yAzIbTBk8u1g208YtGzkjGG2MG/fEW9
V6G35Rgqgi+BC5YwsjRP0LrqXBGoc7JqY2DYt0hRA2urD/ms01DkVgErGBJgaAs1
vaPrfaUu8SAYDr0INNFfpDmo4sFcO0vWaEQ6HCt6LbNxARdjEObJ+cDk3QYiyWq+
ttZxcTrjmJ9eWJMH4m34i3QOI4LpMQ==
=PtbG
-----END PGP SIGNATURE-----

--Sig_/msBv5YKQHsia=WBv1OUTT1I--
