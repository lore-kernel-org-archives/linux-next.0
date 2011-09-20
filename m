From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with Linus' tree
Date: Tue, 20 Sep 2011 13:22:25 +1000
Message-ID: <20110920132225.0c912a905789a688eebb2a89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_Sep_2011_13_22_25_+1000_fowl0XtZHas0ZYIR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:38452 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753759Ab1ITDWe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2011 23:22:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>

--Signature=_Tue__20_Sep_2011_13_22_25_+1000_fowl0XtZHas0ZYIR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-pci.c between commit 16a9d06c753a
("iwlagn: sysfs couldn't find the priv pointer") from Linus' tree and
commit 18d0077f0c4a ("iwlagn: remove drvdata support from bus layer")
from the wireless tree.

I fixed it up (I used the version from the wireless tree) and can carry
the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_Sep_2011_13_22_25_+1000_fowl0XtZHas0ZYIR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOeAbxAAoJEDMEi1NhKgbsHkMIAI6Eo9xI1PG0S+oBwY/TPRoi
526p897V0heRqemTRJvVxvBU0RtgfIdd568PklzuMoqZPYAI2H8mS3JaFkcbDrX9
6XELlOVGUGhK45kvda1o0fYULQIcIbIfqTObO/z3WmJxZF+nwhxUMtLH7sAYT5L9
wZdPEUMPesQ03KlBExTjElNqhHxRQpPnoFBQWGnjduKQXzdNbdXT7EQar994wxIJ
e5ZUp3GbIUkPkaNVDdhU0yWKIBNkTk4I8+5O6C0CRjpHtA+qBUwll1GYFuotMbpZ
b+/k9PMTkRmwjVqkBxHaiF3Uoj7ECwWhyHqTq8updTeZmdK3KI+swYb4m9dFJZ8=
=n7/y
-----END PGP SIGNATURE-----

--Signature=_Tue__20_Sep_2011_13_22_25_+1000_fowl0XtZHas0ZYIR--
