From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 24 - missing files in
 drivers/media/dvb/
Date: Wed, 25 Jun 2008 13:48:59 +1000
Message-ID: <20080625134859.6bc218c4.sfr@canb.auug.org.au>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au>
	<486134B4.4050400@linux.vnet.ibm.com>
	<20080625132810.6f31b571.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_13_48_59_+1000_9kivaz_FuL65iOM0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49083 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752311AbYFYDtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 23:49:11 -0400
In-Reply-To: <20080625132810.6f31b571.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-testers@vger.kernel.org, v4l-dvb-maintainer@linuxtv.org, Andy Whitcroft <apw@shadowen.org>

--Signature=_Wed__25_Jun_2008_13_48_59_+1000_9kivaz_FuL65iOM0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Wed, 25 Jun 2008 13:28:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 24 Jun 2008 23:23:56 +0530 Kamalesh Babulal <kamalesh@linux.vnet.=
ibm.com> wrote:
> >
> > allyesconfig kernel build on next-20080624, fails due to missing files
> >=20
> > drivers/media/video/em28xx/em28xx-dvb.c:30:22: error: drx397xD.h: No su=
ch file or directory
>=20
> To fix this, I have reverted commit
> 969ff74e0ab707801150dc83eb254794bc574442 ("V4L/DVB (8006): em28xx: Split
> HVR900 into two separate entries") from linux-next for today.

Although, on reflection, this may have been caused by the mismerge
yesterday.  I will leave it in tomorrow unless I am told otherwise.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_13_48_59_+1000_9kivaz_FuL65iOM0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhwCsACgkQTgG2atn1QN+9wACbBEayEZ9L5z7afTkIW5LSJ+na
XeoAn1sD/5dOfGF26NKiPXNoqww2Yi04
=sF4D
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_13_48_59_+1000_9kivaz_FuL65iOM0--
