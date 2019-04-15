From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with the
 wireless-drivers tree
Date: Mon, 15 Apr 2019 12:08:53 +1000
Message-ID: <20190415120853.39e0e46a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NXPNfRBIc4_Zh=Iruc5coyI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ihab Zhaika <ihab.zhaika@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NXPNfRBIc4_Zh=Iruc5coyI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-drivers-next tree got a
conflict in:

  drivers/net/wireless/intel/iwlwifi/pcie/drv.c

between commits:

  0d5bad14226a ("iwlwifi: rename structs to fit the new names")
  972d8e137779 ("iwlwifi: add new 0x2723/0x2080 card for 22000")

from the wireless-drivers tree and commit:

  ef8a913766cd ("iwlwifi: remove misconfigured pci ids from 22260 series")

from the wireless-drivers-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/intel/iwlwifi/pcie/drv.c
index 9f1af8da9dc1,0329b626ada6..000000000000
--- a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
@@@ -953,19 -953,15 +953,15 @@@ static const struct pci_device_id iwl_h
  	{IWL_PCI_DEVICE(0xA0F0, 0x1652, killer1650i_2ax_cfg_qu_b0_hr_b0)},
  	{IWL_PCI_DEVICE(0xA0F0, 0x4070, iwl_ax101_cfg_qu_hr)},
 =20
 -	{IWL_PCI_DEVICE(0x2723, 0x0080, iwl22260_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x0084, iwl22260_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x0088, iwl22260_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x008C, iwl22260_2ax_cfg)},
 +	{IWL_PCI_DEVICE(0x2723, 0x0080, iwl_ax200_cfg_cc)},
 +	{IWL_PCI_DEVICE(0x2723, 0x0084, iwl_ax200_cfg_cc)},
 +	{IWL_PCI_DEVICE(0x2723, 0x0088, iwl_ax200_cfg_cc)},
 +	{IWL_PCI_DEVICE(0x2723, 0x008C, iwl_ax200_cfg_cc)},
  	{IWL_PCI_DEVICE(0x2723, 0x1653, killer1650w_2ax_cfg)},
  	{IWL_PCI_DEVICE(0x2723, 0x1654, killer1650x_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x2080, iwl22260_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x4080, iwl22260_2ax_cfg)},
 -	{IWL_PCI_DEVICE(0x2723, 0x4088, iwl22260_2ax_cfg)},
 +	{IWL_PCI_DEVICE(0x2723, 0x2080, iwl_ax200_cfg_cc)},
 +	{IWL_PCI_DEVICE(0x2723, 0x4080, iwl_ax200_cfg_cc)},
 +	{IWL_PCI_DEVICE(0x2723, 0x4088, iwl_ax200_cfg_cc)},
-=20
- 	{IWL_PCI_DEVICE(0x1a56, 0x1653, killer1650w_2ax_cfg)},
- 	{IWL_PCI_DEVICE(0x1a56, 0x1654, killer1650x_2ax_cfg)},
-=20
  	{IWL_PCI_DEVICE(0x2725, 0x0090, iwlax210_2ax_cfg_so_hr_a0)},
  	{IWL_PCI_DEVICE(0x7A70, 0x0090, iwlax210_2ax_cfg_so_hr_a0)},
  	{IWL_PCI_DEVICE(0x7A70, 0x0310, iwlax210_2ax_cfg_so_hr_a0)},

--Sig_/NXPNfRBIc4_Zh=Iruc5coyI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz57UACgkQAVBC80lX
0GycRwf/TJ5j6jINo+rxZJmG/3J9ND8BMB4ej/SDCYiVCVv+7Og3CY1XcKRw8t5C
NPD9CwpFbPdIEiaxSVkml5UQyDOH7xdspodUyBxz8602E/0kGU/hmU4bFfqf5sa3
y3NNcSBeVd8tQcfcswhbtmT4aH5NKa2B277wpCCE31AmcSVNuArSGcjE0vpnZGvI
sPmz/Gc202aXdmJ3k3Q8i2hgwZ6J6ZF76dkJQskRhGua7oZTsBEpzmeTtmkg/1eL
pKuyn+d9wiwpX8kvhUXxVBvNXxvSQ3QF2hfJxCfHoaRI3aLD+E2TgCENLWIdw4H3
OLvHpCAHDkBRxPcy4783PjmaqyacGw==
=99KX
-----END PGP SIGNATURE-----

--Sig_/NXPNfRBIc4_Zh=Iruc5coyI--
