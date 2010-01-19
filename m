From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build failure
Date: Tue, 19 Jan 2010 15:06:53 +1100
Message-ID: <20100119150653.1b9bbf67.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Jan_2010_15_06_53_+1100_Wy_W41VbQLHf+Q2i"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56848 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752780Ab0ASEHI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 23:07:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Maccarrone <darkstar6262@gmail.com>

--Signature=_Tue__19_Jan_2010_15_06_53_+1100_Wy_W41VbQLHf+Q2i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mfd/htc-i2cpld.c: In function 'htcpld_set_type':
drivers/mfd/htc-i2cpld.c:106: error: 'irq_desc' undeclared (first use in th=
is function)

Caused by commit b4714172cd2f1cd8694546169237c30c5b4fdf3b ("mfd: Add
HTCPLD driver").

I have used the mfd tree from next-20100118 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Jan_2010_15_06_53_+1100_Wy_W41VbQLHf+Q2i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktVL90ACgkQjjKRsyhoI8yJYwCaA2CKOZ7cFNQwq5ilGn8kP4DP
4xcAn2DcJVx3z9OOnI+cGoixaXuVAsVL
=Tx8Y
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Jan_2010_15_06_53_+1100_Wy_W41VbQLHf+Q2i--
