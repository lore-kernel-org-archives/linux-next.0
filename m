From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] misc/eeprom: fix at24 printk format
Date: Fri, 27 Nov 2009 17:46:45 +1100
Message-ID: <20091127174645.6d937080.sfr@canb.auug.org.au>
References: <20091126203837.b64fb4d3.sfr@canb.auug.org.au>
	<4B0F7008.8000204@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Nov_2009_17_46_45_+1100_Z_0m3NZ6w4NK1SPP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41986 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750964AbZK0Gqo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 01:46:44 -0500
In-Reply-To: <4B0F7008.8000204@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, David Brownell <dbrownell@users.sourceforge.net>

--Signature=_Fri__27_Nov_2009_17_46_45_+1100_Z_0m3NZ6w4NK1SPP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Thu, 26 Nov 2009 22:22:00 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> From: Randy Dunlap <randy.dunlap@oracle.com>
>=20
> Fix printk format warning:
>=20
> drivers/misc/eeprom/at24.c:230: warning: format '%zd' expects type 'signe=
d size_t', but argument 6 has type 'int'

Already fixed in today's linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Nov_2009_17_46_45_+1100_Z_0m3NZ6w4NK1SPP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksPddUACgkQjjKRsyhoI8x5pgCeMpnTovESljRODn6NHaC7LWVs
oxYAni/fDVbGa8nnCSnwT5zK/UfzGlTm
=1Cjc
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Nov_2009_17_46_45_+1100_Z_0m3NZ6w4NK1SPP--
