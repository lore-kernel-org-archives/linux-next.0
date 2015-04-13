From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc-mpe tree with the powerpc
 tree
Date: Mon, 13 Apr 2015 13:30:15 +1000
Message-ID: <20150413133015.3c77e757@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9/AkB+VwBfUR.YG5mMYtfvW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46539 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753084AbbDMDaW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 23:30:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>, Wei Yang <weiyang@linux.vnet.ibm.com>

--Sig_/9/AkB+VwBfUR.YG5mMYtfvW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc-mpe tree got a conflict in
arch/powerpc/platforms/powernv/pci-ioda.c between commit 6e628c7d33d9
("powerpc/powernv: Reserve additional space for IOV BAR according to
the number of total_pe") from the powerpc tree and commit 65ebf4b6370e
("powerpc/powernv: Move controller ops from ppc_md to controller_ops")
from the powerpc-mpe tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/platforms/powernv/pci-ioda.c
index 5ac7c60a8801,5e917753c672..000000000000
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@@ -2808,13 -2103,9 +2809,13 @@@ static void __init pnv_pci_init_ioda_ph
  	 * the child P2P bridges) can form individual PE.
  	 */
  	ppc_md.pcibios_fixup =3D pnv_pci_ioda_fixup;
- 	ppc_md.pcibios_enable_device_hook =3D pnv_pci_enable_device_hook;
- 	ppc_md.pcibios_window_alignment =3D pnv_pci_window_alignment;
- 	ppc_md.pcibios_reset_secondary_bus =3D pnv_pci_reset_secondary_bus;
+ 	pnv_pci_controller_ops.enable_device_hook =3D pnv_pci_enable_device_hook;
+ 	pnv_pci_controller_ops.window_alignment =3D pnv_pci_window_alignment;
+ 	pnv_pci_controller_ops.reset_secondary_bus =3D pnv_pci_reset_secondary_b=
us;
 +#ifdef CONFIG_PCI_IOV
 +	ppc_md.pcibios_fixup_sriov =3D pnv_pci_ioda_fixup_iov_resources;
 +	ppc_md.pcibios_iov_resource_alignment =3D pnv_pci_iov_resource_alignment;
 +#endif /* CONFIG_PCI_IOV */
  	pci_add_flags(PCI_REASSIGN_ALL_RSRC);
 =20
  	/* Reset IODA tables to a clean state */

--Sig_/9/AkB+VwBfUR.YG5mMYtfvW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKzhMAAoJEMDTa8Ir7ZwVkeMP/0YeTq+aFi0feWAQ045TK+DZ
q2xHm+1xwhmMgf4iBVwXquEBNuOkdY33yKl/wPpTSnbUgeZi4wzefxaEacDglhU0
R2nTqg5YG83zPCP0gfmt0FV0R8enZMcB2K7pjt4KFKXFUdsQDOm6JFAhInfNkhI4
YM4jHYDl4OvcqMpuSwU73zqg3H0hz6dhE2q8Vju45N5Yrk8yrhP1a2/MG1J5w6mQ
8SDVBXG9DoPgmCC2YNjvrf6qnXm95a4jWDeU6qVYTW6Tcx4od4+6r2x1E7/YuEJi
9epIhGHMPCdXagq2Xs/F76VfEMGc+AX4nkAeK4qqTXgINPtahbRdEYPJ+0/5xXVT
xpznZcD3EAzWwhnwoo/lgp6P8lLGJ1kSMzQJH96ejOPHHimHonKk89iCDUdqILKA
Qjqrq2V8nGW7evZGWh9BVKdhZuYxqTsvYEpqqxqQil5WEO/d4g7OOn857uqQwadf
Hw4Yzm9ay3dJiqYCvib/wppsksBFI2TWtc9Ypa7OtjIXQNadcc95dZYKS93sj9ZS
AyVI+EQ1hWrnWoCySEYZrPtPj71/Tcr7E8QJgrn26XHqWutRWBwhvHGDurm3K33i
Tli0ezh31nQFD0VF7mwspAE1da8aU6PTInenCuzw3qIC8MsgGCpF+R/eqDdytW8A
qehiyjamd3FJe2jWeifD
=YSyD
-----END PGP SIGNATURE-----

--Sig_/9/AkB+VwBfUR.YG5mMYtfvW--
