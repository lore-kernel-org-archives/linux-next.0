From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: voltage tree build failure
Date: Wed, 21 Jan 2009 13:46:00 +1100
Message-ID: <20090121134600.d6e60b2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__21_Jan_2009_13_46_00_+1100_RZXP4dKir+p80A/e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57012 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754565AbZAUCqO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 21:46:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>

--Signature=_Wed__21_Jan_2009_13_46_00_+1100_RZXP4dKir+p80A/e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/regulator/wm8350-regulator.c: In function 'pmic_uv_handler':
drivers/regulator/wm8350-regulator.c:1296: error: dereferencing pointer to =
incomplete type
drivers/regulator/wm8350-regulator.c:1305: error: dereferencing pointer to =
incomplete type

Immediate cause is commit 872ed3fe176833f7d43748eb88010da4bbd2f983
("Regulator: Push lock out of _notifier_call_chain + add voltage change
event").

I have dropped the voltage tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__21_Jan_2009_13_46_00_+1100_RZXP4dKir+p80A/e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl2jGgACgkQjjKRsyhoI8yz4wCfTghn6ZU1Dyairv0aYYEcc9m/
MGUAni1Ot3CerHnKo7s5Xq13zTe/sxA4
=jRZD
-----END PGP SIGNATURE-----

--Signature=_Wed__21_Jan_2009_13_46_00_+1100_RZXP4dKir+p80A/e--
