From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build warning
Date: Wed, 18 Feb 2009 17:31:59 +1100
Message-ID: <20090218173159.e156e5ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Feb_2009_17_31_59_+1100_aWCcVpTpbo+r6_cX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59994 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751733AbZBRGcL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Feb 2009 01:32:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__18_Feb_2009_17_31_59_+1100_aWCcVpTpbo+r6_cX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/pci/setup-bus.c: In function 'pci_bus_assign_resources':
drivers/pci/setup-bus.c:503: warning: passing argument 1 of 'pbus_assign_re=
sources_sorted' discards qualifiers from pointer target type

Caused by commit 1454fec9f61d92514bf3300f8ae99ba7749ccd0c ("PCI: constify
pci_bus_assign_resources()").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Feb_2009_17_31_59_+1100_aWCcVpTpbo+r6_cX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmbq18ACgkQjjKRsyhoI8xO4QCfY+RhD7g7mlxIBYIYki+FoE5t
49MAnjh3RMaLZ7Fz/TQIkA/9IIss1u9W
=N04v
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Feb_2009_17_31_59_+1100_aWCcVpTpbo+r6_cX--
