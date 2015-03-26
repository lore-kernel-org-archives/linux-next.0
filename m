From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the arm64-acpi
 tree
Date: Thu, 26 Mar 2015 17:31:27 +1100
Message-ID: <20150326173127.27fc5f42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8PWEwnj/W/AbQJY1+ARKhmE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58993 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbbCZGbg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2015 02:31:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hanjun Guo <hanjun.guo@linaro.org>, David Vrabel <david.vrabel@citrix.com>

--Sig_/8PWEwnj/W/AbQJY1+ARKhmE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in
drivers/xen/Kconfig between commit 94ccae47e02d ("XEN / ACPI: Make XEN
ACPI depend on X86") from the arm64-acpi tree and commit 628c28eefd6f
("xen: unify foreign GFN map/unmap for auto-xlated physmap guests")
from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/xen/Kconfig
index a31cd29b68a8,afc39ca5cc4f..000000000000
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@@ -253,8 -253,10 +253,14 @@@ config XEN_EF
  	def_bool y
  	depends on X86_64 && EFI
 =20
 +config XEN_ACPI
 +	def_bool y
 +	depends on X86 && ACPI
 +
+ config XEN_AUTO_XLATE
+ 	def_bool y
+ 	depends on ARM || ARM64 || XEN_PVHVM
+ 	help
+ 	  Support for auto-translated physmap guests.
+=20
  endmenu

--Sig_/8PWEwnj/W/AbQJY1+ARKhmE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE6fEAAoJEMDTa8Ir7ZwVtU8P/3CnkknpF+jG2oVDcs9nK2Gb
X7krY1Tky7tOuvRR5WJFTasu1x8zafeoiTMppAU6vysCe66PR4xvI8zBg9FfEfKT
XbJGS0NxzjiVCEUGsX0/L6r5cUs3tT2TwvFFeQqnR80+zlotPpN6KrL/gsNKHKvS
3fQPNc5eKXwNJ8INop7X7ifE0zOIE9Cv+NRmi7B1IfJQ+G1DlcSAJJlD4qDrvmVY
YopdgHOeWoprvLpZlgOFO2BsCBlFhVP8bYb/mjB1aVTbQ4r9U6LAF3iT00Mu9qGx
llGPZ0H8u5w1PPXYg1eYVilK7Xd0lM9fDlEyqhHMnrQzSeZSXH5hp9l9g6I5YjF0
qPkwgGMoN1dZDSHPVqqwozFYvMhvacD8S7D2alOApix9bVqu6TI112V2+zDwCN+2
H2pLpcpQRvkSut147IUXkVJhdas/X3OFhLR5Y2cFrT5zT48TzxKl16zRrMs2xGUs
mlPLU1jB4kVd6J66KrmqGpZndnCfarDwqNj9dUQCaPcljpLQ2vhvUpq+3HZ+TEJH
hYlHTl6rYssnfiDyqEn7Ff4kYd1wZlMqHMMAflndhaSfK1WkICMlapgIBze2SwkF
VvAsoIyrneFu0mNLwNdV4lLtzn/+6M4uvu5gOrw+OEyTl49h7SSQipxDe0v23DND
b7UbGN05+NX4jA4tmyky
=pS2v
-----END PGP SIGNATURE-----

--Sig_/8PWEwnj/W/AbQJY1+ARKhmE--
