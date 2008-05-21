From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i2c quilt series incomplete
Date: Wed, 21 May 2008 16:16:22 +1000
Message-ID: <20080521161622.ba6c61a5.sfr@canb.auug.org.au>
References: <20080521104041.0e99ac35.sfr@canb.auug.org.au>
	<20080521081308.79ab309d@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__21_May_2008_16_16_22_+1000_7asVRO4BsnO12foS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38180 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932789AbYEUGQ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 May 2008 02:16:28 -0400
In-Reply-To: <20080521081308.79ab309d@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__21_May_2008_16_16_22_+1000_7asVRO4BsnO12foS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Wed, 21 May 2008 08:13:08 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>
> On Wed, 21 May 2008 10:40:41 +1000, Stephen Rothwell wrote:
> > When fetching the i2c series this morning, I got a 404 error for
> > i2c-core-use-list_for_each_entry_safe.diff, so I have commented it out =
of
> > the series file for today.
>=20
> Oops, sorry for the trouble once again. This is fixed now. My upload
> script only picks *.patch files so it missed that one. I've modified
> my script to warn me when a file is referenced in series but doesn't
> exist, so it should not happen again.

OK, thanks for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__21_May_2008_16_16_22_+1000_7asVRO4BsnO12foS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIM746TgG2atn1QN8RAsFKAJ93brN9UUYHaOzcCNypGViBIQ9sMQCfeRvN
DC0QDiL4d1EuWFGx/wuhfpk=
=WQxI
-----END PGP SIGNATURE-----

--Signature=_Wed__21_May_2008_16_16_22_+1000_7asVRO4BsnO12foS--
