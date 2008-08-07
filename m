From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for August 5 (MTD build error)
Date: Thu, 7 Aug 2008 14:40:27 +1000
Message-ID: <20080807144027.f805c7b1.sfr@canb.auug.org.au>
References: <20080805175914.7649537f.sfr@canb.auug.org.au>
	<20080805175518.9fc09b92.randy.dunlap@oracle.com>
	<200808060320.20064.david-b@pacbell.net>
	<200808060413.08723.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Aug_2008_14_40_27_+1000_hHhkR6MQhuzFyJap"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43606 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753272AbYHGFJc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 01:09:32 -0400
In-Reply-To: <200808060413.08723.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, dwmw2@infradead.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Thu__7_Aug_2008_14_40_27_+1000_hHhkR6MQhuzFyJap
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 6 Aug 2008 04:13:08 -0700 David Brownell <david-b@pacbell.net> wrot=
e:
>
> On Wednesday 06 August 2008, David Brownell wrote:
> > On Tuesday 05 August 2008, Randy Dunlap wrote:
> > >=20
> > > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c: In function =
'add_dataflash_otp':
> > > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c:670: error: t=
oo many arguments to function 'otp_setup'
>=20
> Whoops, sorry ... I see what was going on.  My bad.
>=20
> --- g26.orig/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:12:45.0000=
00000 -0700
> +++ g26/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:11:55.000000000=
 -0700
> @@ -616,7 +616,7 @@ static char *otp_setup(struct mtd_info *
> =20
>  #else
> =20
> -static char *otp_setup(struct mtd_info *device)
> +static char *otp_setup(struct mtd_info *device, char revision)
>  {
>  	return " (OTP)";
>  }
>=20

I will add this patch to linux-next today in the hope it will be
integrated somewhere soon (hint, hint :-)).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Aug_2008_14_40_27_+1000_hHhkR6MQhuzFyJap
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiafLsACgkQjjKRsyhoI8xjCwCfYHSNDPrvgO6X5Egfc5gbu2nR
oioAn0S+vzgDMXb305h24GKf4Ew1F4YW
=oU/m
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Aug_2008_14_40_27_+1000_hHhkR6MQhuzFyJap--
