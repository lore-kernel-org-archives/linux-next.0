From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-tegra tree
Date: Mon, 4 Feb 2019 08:30:03 +0100
Message-ID: <20190204073003.GB16448@ulmo>
References: <20190204111241.278b6215@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190204111241.278b6215@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2019 at 11:12:41AM +1100, Stephen Rothwell wrote:
> Hi Thierry,
>=20
> After merging the drm-tegra tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/host1x/cdma.c: In function 'host1x_cdma_wait_pushbuffer_space=
':
> drivers/gpu/host1x/cdma.c:279:13: error: 'struct host1x_cdma' has no memb=
er named 'sem'
>    down(&cdma->sem);
>              ^~
>=20
> Caused by commit
>=20
>   abb289796799 ("gpu: host1x: Use completion instead of semaphore")
>=20
> interacting with commit
>=20
>   db5652be58a9 ("gpu: host1x: Introduce support for wide opcodes")
>=20
> I have used the drm-tegra tree from next-20190201 for today.

Oh my... so I go through all the build testing and then pull in the
seemlessly harmless fix and ruin everything...

I've fixed it up in my tree now, thanks.

Thierry

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxX6fsACgkQ3SOs138+
s6HwkA/+NQ62abvdo/YP6rg2FdIQbFVodcXKOf0wvWAE//O6xdEFtHghQaHbzkn1
jp+Guv8Y6/mEnHHfbsTE+OUXh1AyRJ0BOq6t7saVA3hiV81IQAuGwSWaV9C/i5dQ
8aRGgkIeegxrECAL4i1+B+EkdZbMif1zZ3fypydI13kdQvl04gUHGl+iKYxwQWJg
rX2dRHbBVbODb6X9PwEslEWfm1ArAAy6z+I98J7sMQ5BLSGqzsD29KxyUR4x107R
g+I6JFz4Djy0SAM+b/h66jyn7fvy3kvpvknOj/9+0sWatGlNUVOKhWcwMww+rg69
cdVPKDrPYm7Eoq7Wf+OHKaXvvqa3yKJudwDW+q8IKU4Aup2/WbKyvog+onJoOdmA
sdUWJ6+XN+7ln5jsY/gwRE0m4Kk7BMLGcwS356Qxun0Ygiy+Dh4igauZV/4hJBKm
vk/wmUEnxzuk4Ffl+jYGynQT/rSVWpxaL1FdsBuh7QrkONPgcPQjma+LuiNV0y9y
DsRuCGY2kTCWlAKO+FH9YkMrkvI++Bcc61qzAzK7o6+pWeOavtjcwMCIMOte2meQ
2DZ50Mi6RA03TEqj4bIutXzY8k61/5z93AJWYJddgyJUMZs0sT4SInvs7X0N8lVZ
ALcvMp8YnrcpxrhlspKABowfVm9o6IG0cuj9O+K6wTAEp4EcR98=
=aLFD
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
