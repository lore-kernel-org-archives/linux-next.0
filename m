From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with Linus' tree
Date: Mon, 13 May 2019 10:49:28 +1000
Message-ID: <20190513104928.0265b40f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/guncOVbWEmKuoXHJ+5r=YwH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@mellanox.com>, Talel Shenhar <talel@amazon.com>
List-Id: linux-next.vger.kernel.org

--Sig_/guncOVbWEmKuoXHJ+5r=YwH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thermal-soc tree got a conflict in:

  MAINTAINERS

between commit:

  f23afd75fc99 ("RDMA/efa: Add driver to Kconfig/Makefile")

from Linus' tree and commit:

  7e34eb7dd067 ("thermal: Introduce Amazon's Annapurna Labs Thermal Driver")

from the thermal-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 2ff031b5e620,7defe065470d..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -745,15 -744,12 +745,21 @@@ S:	Supporte
  F:	Documentation/networking/device_drivers/amazon/ena.txt
  F:	drivers/net/ethernet/amazon/
 =20
+ AMAZON ANNAPURNA LABS THERMAL MMIO DRIVER
+ M:	Talel Shenhar <talel@amazon.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/thermal/amazon,al-thermal.txt
+ F:	drivers/thermal/thermal_mmio.c
+=20
 +AMAZON RDMA EFA DRIVER
 +M:	Gal Pressman <galpress@amazon.com>
 +R:	Yossi Leybovich <sleybo@amazon.com>
 +L:	linux-rdma@vger.kernel.org
 +Q:	https://patchwork.kernel.org/project/linux-rdma/list/
 +S:	Supported
 +F:	drivers/infiniband/hw/efa/
 +F:	include/uapi/rdma/efa-abi.h
 +
  AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
  M:	Tom Lendacky <thomas.lendacky@amd.com>
  M:	Gary Hook <gary.hook@amd.com>

--Sig_/guncOVbWEmKuoXHJ+5r=YwH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzYvxgACgkQAVBC80lX
0GyvtAf/cZ+z0g02uhGdK2xyMyYYXeQpeXq54Mwf1Rib2a9aiyUC+L9H2KyE3Oc8
+AftI2g1oL4jkY8iEnnKsZ+weWzD4wNtTW8MTnTw98v5Pb2AHUxsY10eyVkrvDQR
8TVXQK9Bpst6OdebVjortGVAUMbzEn/GkH+EJhlBY5+nNc9smzon9CjaoWwagXF+
gbq4nvhUHQC1HBX+VCJZuh1l7dqYhp8MfD8Nuf33aI6YjFJF6plefHQ8AvoAEwqC
gfLKGwpvERmWHT5oK8AXzOPeCkNkXzQPVOtTKivpYlNkYoQPIxtXe9v6JDut+j5c
Z6HMftc6xcGsCW14Z+w8nmB/bOPxzg==
=ja3g
-----END PGP SIGNATURE-----

--Sig_/guncOVbWEmKuoXHJ+5r=YwH--
