From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: suspend tree build warnings
Date: Wed, 19 Aug 2009 17:24:19 +1000
Message-ID: <20090819172419.2cf53008.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Aug_2009_17_24_19_+1000_TFfUs1HCNqM8xAoP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44055 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbZHSHY1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Aug 2009 03:24:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__19_Aug_2009_17_24_19_+1000_TFfUs1HCNqM8xAoP
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/media/dvb/frontends/dib7000p.c: In function =E2=80=98dib7000p_i2c_e=
numeration=E2=80=99:
drivers/media/dvb/frontends/dib7000p.c:1315: warning: the frame size of 225=
6 bytes is larger than 2048 bytes
drivers/media/dvb/frontends/dib3000mc.c: In function =E2=80=98dib3000mc_i2c=
_enumeration=E2=80=99:
drivers/media/dvb/frontends/dib3000mc.c:853: warning: the frame size of 216=
0 bytes is larger than 2048 bytes

Introduced by commit 99307958cc9c1b0b2e0dad4bbefdafaf9ac5a681 ("PM:
Introduce core framework for run-time PM of I/O devices (rev. 17)").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Aug_2009_17_24_19_+1000_TFfUs1HCNqM8xAoP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqLqKMACgkQjjKRsyhoI8wrpACdF4HO6Fjg2DBJ9f9s/foijm6Q
W24AniaTv4x9imuRgdkRJeGIcks2lmIN
=IFlD
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Aug_2009_17_24_19_+1000_TFfUs1HCNqM8xAoP--
