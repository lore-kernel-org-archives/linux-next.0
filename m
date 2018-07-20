From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Fri, 20 Jul 2018 11:03:10 +1000
Message-ID: <20180720110310.6d07e86e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X2ehTojAadPModQngJYUH7O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Evan Wang <xswang@marvell.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/X2ehTojAadPModQngJYUH7O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/pci-aardvark.c

between commit:

  1df3e5b3feeb ("PCI: aardvark: Fix I/O space page leak")

from Linus' tree and commit:

  6df6ba974a55 ("PCI: aardvark: Remove PCIe outbound window configuration")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/pci-aardvark.c
index 0fae816fba39,d5030cd06197..000000000000
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@@ -843,13 -809,7 +809,7 @@@ static int advk_pcie_parse_request_of_p
 =20
  		switch (resource_type(res)) {
  		case IORESOURCE_IO:
- 			advk_pcie_set_ob_win(pcie, 1,
- 					     upper_32_bits(res->start),
- 					     lower_32_bits(res->start),
- 					     0,	0xF8000000, 0,
- 					     lower_32_bits(res->start),
- 					     OB_PCIE_IO);
 -			err =3D pci_remap_iospace(res, iobase);
 +			err =3D devm_pci_remap_iospace(dev, res, iobase);
  			if (err) {
  				dev_warn(dev, "error %d: failed to map resource %pR\n",
  					 err, res);

--Sig_/X2ehTojAadPModQngJYUH7O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRNM4ACgkQAVBC80lX
0GzuSgf3f+bamRU7gw2KJLxSFzsbIaW3XtrwlURFfagQ5qq3Dn5o3e22cjX8TFc3
JN/Ha6/qVWNRKPaRwPJQV8C1ms7+Ea9uVogIz0U/Y7qDtCtvy/3Q9jpyTz9kUinZ
bwvXemoSq1079TjIOrzPpKZ/QF3iRMk7m5Sw9GTpeJiAvdKsq25Gbu+8iEy5QPVM
J37gD+mFiFORauxC47PVQNJCnCpWOtXrz9y788DguVFg1H3RqPQhYMeq6U9x1nxg
Ikdor2LwwuH6YkAExJ2+DRLE3hWrDIBnjqLLEjk3XsSuiCre3LN8OrDCYcmUenuj
Xbd6D7XmKbf2cdKQZFAv0yblelg2
=sD9w
-----END PGP SIGNATURE-----

--Sig_/X2ehTojAadPModQngJYUH7O--
