From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with the pci tree
Date: Tue, 16 Oct 2018 09:56:12 +1100
Message-ID: <20181016095612.36b5e7bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h/26W0fuzPBTdFRLUBNkVJm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

--Sig_/h/26W0fuzPBTdFRLUBNkVJm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/driver-api/index.rst

between commit:

  7618a41f1a25 ("docs-rst: Add a new directory for PCI documentation")

from the pci tree and commit:

  ea2ae0ecc9ad ("FireWire: add a Documentation driver-api chapter")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/driver-api/index.rst
index e9e7d24169cf,1f0cdba2b2bf..000000000000
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@@ -29,7 -29,8 +29,8 @@@ available subsections can be seen below
     iio/index
     input
     usb/index
+    firewire
 -   pci
 +   pci/index
     spi
     i2c
     hsi

--Sig_/h/26W0fuzPBTdFRLUBNkVJm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvFGwwACgkQAVBC80lX
0GxWYwf+N+0E8MBZaAMYtf2UIoUGlDW28VykzexxXw8mQSt+CkJzZAotCJzPPNa8
k/IPFiG2tkSVS2olPJ742reoGxx8VDzyu2vSyPanOrjG3v92HTdI8GmwAr1zFHwd
rsFQnPM5t7qGU+2V2AakPICZrAe5Hzvd7RWX0EDwYil+U/woENAQ5srsHrfdPFlu
3UmBTNnnVWqsRHVh32nH1b+ew5OArj78+S6HyPnAe4MWl2jliDjIJr1f39XPLJXc
V/kt5Yof20nYm7B4RdX2TwscSdTLPAdn7scp/d35MHrMVm34WF3hqjYgaMkSaaA8
G1pdFKd70StStt0xz1gZ0Co+aHJJzw==
=vqYC
-----END PGP SIGNATURE-----

--Sig_/h/26W0fuzPBTdFRLUBNkVJm--
