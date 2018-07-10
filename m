From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the pci tree
Date: Tue, 10 Jul 2018 16:57:11 +1000
Message-ID: <20180710165711.0e618002@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_qaZzBCzhS_iCNt8GQN0syz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Doug Meyer <dmeyer@gigaio.com>, Logan Gunthorpe <logang@deltatee.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_qaZzBCzhS_iCNt8GQN0syz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/ntb/hw/mscc/ntb_hw_switchtec.c

between commit:

  cfdfc14e7fb8 ("switchtec: Use generic PCI Vendor ID and Class Code")

from the pci tree and commit:

  a2a35435484e ("ntb: ntb_hw_switchtec: cleanup 64bit IO defines to use the=
 common header")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/ntb/hw/mscc/ntb_hw_switchtec.c
index 5ee5f40b4dfc,f403da24b833..000000000000
--- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
+++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
@@@ -13,13 -13,13 +13,14 @@@
   *
   */
 =20
- #include <linux/switchtec.h>
- #include <linux/module.h>
+ #include <linux/interrupt.h>
+ #include <linux/io-64-nonatomic-lo-hi.h>
  #include <linux/delay.h>
  #include <linux/kthread.h>
- #include <linux/interrupt.h>
+ #include <linux/module.h>
  #include <linux/ntb.h>
 +#include <linux/pci.h>
+ #include <linux/switchtec.h>
 =20
  MODULE_DESCRIPTION("Microsemi Switchtec(tm) NTB Driver");
  MODULE_VERSION("0.1");

--Sig_/_qaZzBCzhS_iCNt8GQN0syz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEWMcACgkQAVBC80lX
0Gx61ggAnJ1X3hV2AEuz18IrRl31FFYD/DRRT0aMAqVEs2E2WdyggJAGwXKRJAEC
+pqiWGr/PvJ0zhFTe2vwaePv0wryWxc03sHsx2GSpIB7VnUlmJgP2An7dMGDCaAr
EKr+pZfWyaAIuIBEoVv854dljn8akZUpCknjKywRSlwsfZoJW89CIhHtBJij4a27
G1ZE+i/gmplN898OO720xsqADxIaKrUzkHlvwtGDapEvnbtXORcM1qWTKMRx7xJf
mLakct+PhSL2vQdx0cCRRpoVGQdwKPEecCsFElFbRMYpIdi5pRqyoOzf+ADCwB2R
crZzEEGo0yZ7dyfVubCsFh57pQwR7w==
=qq1B
-----END PGP SIGNATURE-----

--Sig_/_qaZzBCzhS_iCNt8GQN0syz--
