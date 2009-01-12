From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build failure
Date: Mon, 12 Jan 2009 14:03:18 +1100
Message-ID: <20090112140318.e25cd2bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_Jan_2009_14_03_18_+1100_rW4bk+NaDScErpLh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36695 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751645AbZALDD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Jan 2009 22:03:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, Balaji Rao <balajirrao@openmoko.org>

--Signature=_Mon__12_Jan_2009_14_03_18_+1100_rW4bk+NaDScErpLh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "__set_irq_handler" [drivers/mfd/pcf50633-core.ko] undefined!
ERROR: "handle_level_irq" [drivers/mfd/pcf50633-core.ko] undefined!

Immediate cause is clearly commit
f52046b14b1e1a8a02ae48d0c69d39c5e204644f ("mfd: PCF50633 core driver")
which introduces this code.  The above functions don't appear to be
exported to modules.

I have dropped the mfd tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_Jan_2009_14_03_18_+1100_rW4bk+NaDScErpLh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklqsvYACgkQjjKRsyhoI8x7DgCgl4f5o+fGVcSghrN6TAq8k7Wp
T18An0xBVU9ArMXMshl7tVVVc/Hm2Y8+
=e4Nf
-----END PGP SIGNATURE-----

--Signature=_Mon__12_Jan_2009_14_03_18_+1100_rW4bk+NaDScErpLh--
