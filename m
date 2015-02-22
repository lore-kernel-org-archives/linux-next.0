From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Sun, 22 Feb 2015 11:22:13 +1100
Message-ID: <20150222112213.72c49d4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2g81J2bAfbklIDpve+gIeGk"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50915 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbbBVAWW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:22:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>

--Sig_/2g81J2bAfbklIDpve+gIeGk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
arch/mips/mm/tlb-r4k.c between commit 9ead8632bbf4 ("MIPS: Fix
C0_Pagegrain[IEC] support") from Linus' tree and commit a5770df09541
("MIPS: Add set/clear CP0 macros for PageGrain register") from the mips
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/mm/tlb-r4k.c
index 30639a6e9b8c,b2afa49beab0..000000000000
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@@ -485,13 -485,11 +485,14 @@@ static void r4k_tlb_configure(void
  		 * Enable the no read, no exec bits, and enable large virtual
  		 * address.
  		 */
 +		u32 pg =3D PG_RIE | PG_XIE;
++
++		if (cpu_has_rixiex)
++			pg |=3D PG_IEC;
  #ifdef CONFIG_64BIT
 -		set_c0_pagegrain(PG_RIE | PG_XIE | PG_ELPA);
 -#else
 -		set_c0_pagegrain(PG_RIE | PG_XIE);
 +		pg |=3D PG_ELPA;
  #endif
- 		if (cpu_has_rixiex)
- 			pg |=3D PG_IEC;
- 		write_c0_pagegrain(pg);
++		set_c0_pagegrain(pg);
  	}
 =20
  	temp_tlb_entry =3D current_cpu_data.tlbsize - 1;

--Sig_/2g81J2bAfbklIDpve+gIeGk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6SE8AAoJEMDTa8Ir7ZwVUjwP+wVCt0JIGj7eOxzcHsTKjhCN
4mtL8g7xasRFtFVI/oTWpVm950YWyrGYypXsSmNXoBWBUl5683/7wIygLbiBLBxZ
TAkwS37VzLCAv48M5hYVRP4dRRTQCSrEXTqDhLO52OEqDiopDu0XxJtEWNcRrU/m
G0xXUh5y7Sq272cjEXB0ycaCWJ6nttUoATDhZO89vs314x9viXImXhcgrTcOBC77
QZT+fchXTNTyAn7l5xWZfkaf0ApXwf7LJHpUf+nkyZFarFGlP7P3Yjna9R7/t7q4
wEXN8+AXBG1mIhhhgF6aELlmRshNjlad9/ArGU+lxiRauqHd/64oc2PfuE+sISp3
K/iNv1T+PJknLvB5pa8LirIYpyHtO6YfqwBTzLvkJ/fJiU8HX0Ggx6qSR404iKb9
OUANrYzSEnC0RsC2Ge4Ym16TGOKYU418VpNY2zEPDeCS5Epy5/Z9M0YC1/5xwzrF
Xzzh/I1MU5SUNPWlfnL+04XoxNj3Ul6Ms4rrHeA8pbCVa1bMOrJ8vYF4rNnYr8qB
KIqA3ENB/HtoUSUjzPnICQAOXxGn3cnbHxVbVLJEN8G5GJAZXCoXjJKl5AUlTuKr
7QxAh2/IDVC0l1wZO+nhKp4bkJsFGLe6MKgj+09mWamd95kXd1ltUS6gHpfWXFty
N9OiUzOBbDOxXQLZKZlh
=BQKU
-----END PGP SIGNATURE-----

--Sig_/2g81J2bAfbklIDpve+gIeGk--
