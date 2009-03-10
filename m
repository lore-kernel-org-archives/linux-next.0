From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: input tree build failure
Date: Tue, 10 Mar 2009 15:49:19 +1100
Message-ID: <20090310154919.31f45de6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Mar_2009_15_49_19_+1100_pmCmpg9vEsaSaOUR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44928 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751466AbZCJEtd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 00:49:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>

--Signature=_Tue__10_Mar_2009_15_49_19_+1100_pmCmpg9vEsaSaOUR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/input/mouse/bcm5974.c: In function 'report_tp_state':
drivers/input/mouse/bcm5974.c:301: error: 'raw_n' undeclared (first use in =
this function)
drivers/input/mouse/bcm5974.c:341: error: 'ibt' undeclared (first use in th=
is function)

Caused by commit d86c56b75718295025be895a0f7a157298c84491 ("Input:
bcm5974 - augment debug information").

I have merged the version of the input tree from next-20090306 instead of
today's.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Mar_2009_15_49_19_+1100_pmCmpg9vEsaSaOUR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm18U8ACgkQjjKRsyhoI8zvUQCdErU/2y8POs7SWNmVOYORsfG3
shcAn14xJVVh5Zd13xisVyxLOj680sOa
=68+V
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Mar_2009_15_49_19_+1100_pmCmpg9vEsaSaOUR--
