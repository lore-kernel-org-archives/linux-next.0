From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the pci tree
Date: Tue, 6 Nov 2012 13:48:26 +1100
Message-ID: <20121106134826.32a117100825204d48150f0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__6_Nov_2012_13_48_26_+1100_8y=etVPvf2T4=o.r"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:54047 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933504Ab2KFCse (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Nov 2012 21:48:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Feng Tang <feng.tang@intel.com>

--Signature=_Tue__6_Nov_2012_13_48_26_+1100_8y=etVPvf2T4=o.r
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in
arch/x86/pci/acpi.c between commit 3f385fa9edce ("x86/PCI: Ignore _SEG on
HP xw9300") from the pci tree and commit 97a7108a3c00 ("ACPI / x86: Add
quirk for "CheckPoint P-20-00" to not use bridge _CRS_ info") from the pm
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/pci/acpi.c
index 49e5195,7010c19..0000000
--- a/arch/x86/pci/acpi.c
+++ b/arch/x86/pci/acpi.c
@@@ -106,16 -98,16 +106,27 @@@ static const struct dmi_system_id pci_c
  			DMI_MATCH(DMI_BIOS_VERSION, "6JET85WW (1.43 )"),
  		},
  	},
 +
 +	/* https://bugzilla.kernel.org/show_bug.cgi?id=3D15362 */
 +	{
 +		.callback =3D set_ignore_seg,
 +		.ident =3D "HP xw9300",
 +		.matches =3D {
 +			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
 +			DMI_MATCH(DMI_PRODUCT_NAME, "HP xw9300 Workstation"),
 +		},
 +	},
++
+ 	/* https://bugzilla.kernel.org/show_bug.cgi?id=3D47981 */
+ 	{
+ 		.callback =3D set_nouse_crs,
+ 		.ident =3D "CheckPoint P-20-00",
+ 		.matches =3D {
+ 			DMI_MATCH(DMI_SYS_VENDOR, "CheckPoint"),
+ 			DMI_MATCH(DMI_PRODUCT_NAME, "P-20-00"),
+ 			DMI_MATCH(DMI_BOARD_NAME, "Bridgeport"),
+ 		},
+ 	},
  	{}
  };
 =20

--Signature=_Tue__6_Nov_2012_13_48_26_+1100_8y=etVPvf2T4=o.r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQmHp6AAoJEECxmPOUX5FEUeQP/jVhlmW3uFLwf0rjCxTC94of
OCN+3Zl6rmK1EjDNc/Q+VFH/PmOgs+VV2GCNA5Aq0ut1S9TcVz7sC+MdLkrxLN7i
kztUBT/juBDF/bYsxA+WSuVJkAMOzvHGWHIFJ0tTpJoBFML2a4SbYgai/X5A7XXD
cAJqiGX1YsRCwtbVwaOKUV1/bsNi1KY6gWRTVUcSw3l3HLPDxEn4UBjRKqDmjUae
5jdwXU+Y4raGcW3lcAOZwQjZjx6dNyORKjQJ2bbIkPGEK64GY5uK/jqSsstzIAXm
Jpsf0fJl90bZoECsHhev2MNaypvopi118e8Zw95v2czNiY0aUnkbeK25xJenZzZb
2/Tx4Jht6mcyXCeoww905XgMiqXt/NvpWaZOUA21A7h7Q1apIP443f0ih/5yeejF
/tmehcVLuUjFkCBHK46ZDiCZRS0A1yrCzjCl2kHaSpDzadhoyOY2OUZ52M89QOqd
RDY77iAus/KpyCFTyNrttMmOW2CTmzuerWz7O1kBUhbDV2SiRBOJ6/6e9vQ9AW60
rGGzOXJGQJ2Mn4BnQcwGli2HBDk9ZLJRVNmrIQvHyGngf7ANTB60Pw8FGDSKAtvv
X0HOLJ8LSjRFgC8PSGhi/MDjAL82C7V8gCnXm2rNwYbs4Lkpf8D5APdTGUGWzwUs
EBLnf8EgIK1wLf2hCyuJ
=9LCj
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Nov_2012_13_48_26_+1100_8y=etVPvf2T4=o.r--
