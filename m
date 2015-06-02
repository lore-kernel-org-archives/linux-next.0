From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Tue, 2 Jun 2015 16:07:23 +1000
Message-ID: <20150602160723.3b519d63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A3n_=nlQH.OejTcp73.LXZQ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56937 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751171AbbFBGHe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 02:07:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Philippe Coval <philippe.coval@open.eurogiciel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>

--Sig_/A3n_=nlQH.OejTcp73.LXZQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

Today's linux-next merge of the drivers-x86 tree got a conflict in
drivers/platform/x86/ideapad-laptop.c between commit 9b071a43553d
("ideapad_laptop: Add Lenovo G40-30 to devices without radio switch")
from Linus' tree and commit 4fa9dabcffc8 ("ideapad_laptop: Lenovo
G50-30 fix rfkill reports wireless blocked") from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/platform/x86/ideapad-laptop.c
index b496db87bc05,1db3d2176d56..000000000000
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@@ -830,13 -830,13 +830,20 @@@ static void ideapad_acpi_notify(acpi_ha
   */
  static const struct dmi_system_id no_hw_rfkill_list[] =3D {
  	{
 +		.ident =3D "Lenovo G40-30",
 +		.matches =3D {
 +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G40-30"),
 +		},
 +	},
 +	{
+ 		.ident =3D "Lenovo G50-30",
+ 		.matches =3D {
+ 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+ 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
+ 		},
+ 	},
+ 	{
  		.ident =3D "Lenovo Yoga 2 11 / 13 / Pro",
  		.matches =3D {
  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),

--Sig_/A3n_=nlQH.OejTcp73.LXZQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbUgjAAoJEMDTa8Ir7ZwVU7AQAJaLCRPINb06ZzF0jLgSUIZB
R+gYNedEv9x6wFWkZzUk1SOOR8GsIZVqOO1Lc5MpBSNbpIZyjFHL4o0M7YS/pkBU
/+4DhmOPHF/cT9ZMzGeu7fhdWzIoCiUyYwbT38mb/1Osmi4apo21RebUHwzn2nLB
G8pKBPQz7adGehIbEPBU4T1v8/pZ5hTayLKXBCuICDzlujm7tZ7On7k7jKTDip1y
R+8K5Ia8nBtOTFhx5N3vRYsvLhjxMolYgvSVlE1+zzN3U08q+O/weKK6/A9CWVoN
o3VgVZT4bQfq4JoI5IJSMfI1RUqqomO4ZzxBycvB1SsWgUn1ymVhwuymw9Nd7W78
99TA+WHPIb8SaEGkSsOFVaPEz8otLrOlfJws/STTasukb1AoCU0W9B7CBUXD7+AN
HuHPIHsp6FgLLBKxE/cRL1MAkH5adBQ10vvevHUzhK298YspEZwm5AJj7RyDFg+c
OtwjZxTepWU3iysZjOdGfR6PX4MuGEVMh7++CsW3RvzIJQ5VaDkiLsEPBOVefK3I
ody+C1tTQKInkNKfCC1FzJ1fdIswW9cAkoqX1jyE048+PFCfi8o6VjihHeNMcE19
+lqIqwaFrF++kxkjnaNNiMcBePjuKtDr7fQykd4HORNwPFzatztimPa3fuWoehts
t/yclnzwQDJugMPASHGW
=WOJ+
-----END PGP SIGNATURE-----

--Sig_/A3n_=nlQH.OejTcp73.LXZQ--
