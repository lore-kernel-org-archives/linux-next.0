From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 24 - missing files in
 drivers/media/dvb/
Date: Wed, 25 Jun 2008 13:31:07 +1000
Message-ID: <20080625133107.4d680f34.sfr@canb.auug.org.au>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au>
	<486134B4.4050400@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_13_31_07_+1000_zO13MBqHpkM6.c7."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54739 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750841AbYFYDbU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 23:31:20 -0400
In-Reply-To: <486134B4.4050400@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-testers@vger.kernel.org, v4l-dvb-maintainer@linuxtv.org, Andy Whitcroft <apw@shadowen.org>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__25_Jun_2008_13_31_07_+1000_zO13MBqHpkM6.c7.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kamalesh,

On Tue, 24 Jun 2008 23:23:56 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ib=
m.com> wrote:
>
> allyesconfig kernel build on next-20080624, fails due to missing files
>=20
>   CHK     include/linux/compile.h
> make[4]: *** No rule to make target `drivers/media/dvb/dvb-usb/anysee.o',=
 needed by `drivers/media/dvb/dvb-usb/dvb-usb.o'.  Stop.
>=20
>   CC      drivers/media/dvb/frontends/cx22702.o
> make[4]: *** No rule to make target `drivers/media/dvb/frontends/drx397xD=
.o', needed by `drivers/media/dvb/frontends/built-in.o'.  Stop.

I am pretty sure that these were caused by me stuffing up the merging of
the v4l-dvb tree yesterday.  It should be OK today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_13_31_07_+1000_zO13MBqHpkM6.c7.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhu/sACgkQTgG2atn1QN8FggCcC5T4JN1w8WnAdi741fPc1Cj8
ggkAnR42mCkPhpkIISa0BX9qF9Gv4YBa
=DM6b
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_13_31_07_+1000_zO13MBqHpkM6.c7.--
