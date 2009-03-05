From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Thu, 5 Mar 2009 11:35:50 +1100
Message-ID: <20090305113550.4369fe92.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Mar_2009_11_35_50_+1100_.oInB84x9wsxoN9/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48656 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753296AbZCEAgD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 19:36:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>

--Signature=_Thu__5_Mar_2009_11_35_50_+1100_.oInB84x9wsxoN9/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/dvb/frontends/stv6110.c:31:21: error: cx23885.h: No such file=
 or directory

Probably caused by commit f8d3ae06b31f28ae98567407c529751032936fd6
("V4L/DVB (10799): Add support for ST STV6110 silicon tuner").

I have dropped the v4l-dvb tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Mar_2009_11_35_50_+1100_.oInB84x9wsxoN9/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmvHmYACgkQjjKRsyhoI8w5UwCffZ8rVUO/XGKcKNgMC6YjYG/n
a3cAn1jA6sLmpdE0egeejX6zhf6qRELs
=Uuwe
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Mar_2009_11_35_50_+1100_.oInB84x9wsxoN9/--
