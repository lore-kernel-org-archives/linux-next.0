From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] watchdog: fix compiler error for missing parenthesis
Date: Fri, 16 Mar 2012 18:03:37 +1100
Message-ID: <20120316180337.e11fdb36acc6a248c9cc04b6@canb.auug.org.au>
References: <4F62DD49.1040909@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__16_Mar_2012_18_03_37_+1100_/5Fn80pNJx1FKAqQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56185 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030278Ab2CPHDx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Mar 2012 03:03:53 -0400
In-Reply-To: <4F62DD49.1040909@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-next@vger.kernel.org, joe@perches.com, Kyungmin Park <kyungmin.park@samsung.com>, Wim Van Sebroeck <wim@iguana.be>

--Signature=_Fri__16_Mar_2012_18_03_37_+1100_/5Fn80pNJx1FKAqQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc'ing the watchdog maintainer]

On Fri, 16 Mar 2012 15:27:21 +0900 Jaehoon Chung <jh80.chung@samsung.com> w=
rote:
>
> Hi Stephen.
>=20
> Joe's patch(watchdog: Use pr_<fmt> and pr_<level>) is missed the parenthe=
sis in s3c2410_wdt.c.
> (based-on latest linux-next repository)
> It's fixed with this patch.
>=20
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 46c251d..04e5a6d 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -523,7 +523,7 @@ static struct platform_driver s3c2410wdt_driver =3D {
> =20
>  static int __init watchdog_init(void)
>  {
> -	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n";
> +	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n");
> =20
>  	return platform_driver_register(&s3c2410wdt_driver);
>  }
>=20


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Mar_2012_18_03_37_+1100_/5Fn80pNJx1FKAqQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPYuXKAAoJEECxmPOUX5FEA1MQAIKB5Ynu/ELV/rXFNHjQbQ+q
vmE0BjR7BlPspP9pghsisEzFW5gH2mcPg5d5Hz5rFN4Gf3x6nyu59D85IW5KmHEg
5xjp+KfdjuoNU18bz8DZ51H9HTfZUdpXW/e5dKZxe8p4BFLcLzP7VhFNC37eDzry
Bkay+/Luo4lbU7AtzUN7eWy5PovF0cNYCXtyxuLVTYL9ll8nq1H84hGq/dyVWkbW
IiRt8j/VS1yR40zeT5y7hSfH9Xk0IkyEfnVJufU0rObgE5r95COOYipTHaXpaXX9
P/i6MlWsNSGPSnUvceJPrusQXtlwr27Mx9Ssb1zzDMtgixJI7ZShAm0GULIxHVoi
3JrxZYmI0YmSRvDoeQAZ9P0hyn85vbLKoYs6H5X+iRpIstO/n8BDbEV+ilDvy2LM
lB5exI+u+v7V5lVJO5zbkfLNxfdFJ8Ckk/DF3v7XBC/0oZOvFXVeOJv/Neketl4q
lL/c5q3le+pn/8e5bOdQiWapv8SOD87srgZ9tgsKmvKBUrEZLkNrGQsW+e+bNq7+
ADVf/1/Ud6u0d0e+o4jVL9kP447rNRvdG+qo5dlBiyVzSsuvMH/4+UsE67p3WLY3
DRQAvYTIEJLlCH8UmIgU8r7NXMPaKNlB0Q9t3z7PlKUiFDoyXVjHSy6j6lHxpwqp
tV49SebUXEJe7XuBzNcd
=6JAk
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Mar_2012_18_03_37_+1100_/5Fn80pNJx1FKAqQ--
