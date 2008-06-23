From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb build failure
Date: Mon, 23 Jun 2008 13:07:09 +1000
Message-ID: <20080623130709.2ab889e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_13_07_09_+1000_wu30zH7Kil2kP1Nu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60541 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752864AbYFWDHR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Jun 2008 23:07:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Sigmund Augdal <sigmund@snap.tv>

--Signature=_Mon__23_Jun_2008_13_07_09_+1000_wu30zH7Kil2kP1Nu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/dvb/ttpci/budget-ci.c:50:21: error: tda827x.h: No such file o=
r directory

I have reverted commit 020c648971a8e49b15848668ac1e100f8c84c804 ("V4L/DVB
(8049): budget-ci: Add support for Technotrend budget C-1501 dvb-c card").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Jun_2008_13_07_09_+1000_wu30zH7Kil2kP1Nu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfE10ACgkQTgG2atn1QN/vpACff+jcAJacYSS324X+GgS0hAcj
h9UAoIw9aXRpnud/MSapW/E2gExhKjrZ
=8EKv
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_13_07_09_+1000_wu30zH7Kil2kP1Nu--
