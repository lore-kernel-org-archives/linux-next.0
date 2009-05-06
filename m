From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build warning
Date: Wed, 6 May 2009 14:30:07 +1000
Message-ID: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_May_2009_14_30_07_+1000_7f_Mk4a=f+pqJ./w"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38961 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751310AbZEFEau (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 00:30:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

--Signature=_Wed__6_May_2009_14_30_07_+1000_7f_Mk4a=f+pqJ./w
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/pci/probe.c: In function '__pci_read_base':
drivers/pci/probe.c:196: warning: large integer implicitly truncated to uns=
igned type

Probably introduced by commit 82160fd142cdf6956a677120426bf5baefcc7cf9
("PCI/x86: don't assume prefetchable ranges are 64bit").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_May_2009_14_30_07_+1000_7f_Mk4a=f+pqJ./w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoBEk8ACgkQjjKRsyhoI8yMJACggba5dkbAGSnO+vIvj5DkfdNR
lL4An0fJohamIdK4OaOa5iEIF22mshAh
=x7mW
-----END PGP SIGNATURE-----

--Signature=_Wed__6_May_2009_14_30_07_+1000_7f_Mk4a=f+pqJ./w--
