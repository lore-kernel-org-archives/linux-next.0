From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next]  da8xx_omapl_defconfig has been removed.
Date: Sat, 22 Mar 2014 08:31:13 +1100
Message-ID: <20140322083113.72604d94be5e39bede3ce9c3@canb.auug.org.au>
References: <532C6145.6070107@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__22_Mar_2014_08_31_13_+1100_.WNSr_hM/LwqSnp5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:56673 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751790AbaCUVb0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Mar 2014 17:31:26 -0400
In-Reply-To: <532C6145.6070107@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

--Signature=_Sat__22_Mar_2014_08_31_13_+1100_.WNSr_hM/LwqSnp5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 21 Mar 2014 11:56:53 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> This target build:
>=20
> http://kisskb.ellerman.id.au/kisskb/target/7977/
>=20
> is no longer valid as of this commit:
>=20
> commit 4b9e44f8d7c9cd166d8304b8f619741c1d59b836
> Author: Sekhar Nori <nsekhar@ti.com>
> Date:   Wed Feb 26 10:41:24 2014 +0530
>=20
>     ARM: davinci: remove da8xx_omapl_defconfig
>    =20
>     Remove da8xx_omapl_defconfig. Use davinci_all_defconfig
>     for da830 and da850 as well.
>    =20
>     Signed-off-by: Sekhar Nori <nsekhar@ti.com>

OK, thanks for letting me know.  I will remove it from the builds.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Sat__22_Mar_2014_08_31_13_+1100_.WNSr_hM/LwqSnp5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTLK+tAAoJEMDTa8Ir7ZwVZywP/2kGbPlAPKdSbSJmUEMWxokp
WT2oOhWdwgmqVD+AFLJK5K6hbtqVFuqm//tw1FuKXLIPY/aUpgd2rfEkLrhWm3zL
hYLsymVNsNp5SGBHwAn7Md8VGy3YTCPXCXep/4VtUOljuQSDvAxTe19DIm2MosRJ
84yev01iaqHkkxEOkA/vnhC/wY7Xv3KsqXvBlNbK2vnFmNGeVyjAiGTW4QrG4sbf
AATRwuiAabOfvhPzyKXtA9Y/DJWG13qO7BtV+RXhMBGIC2iscdNPXyAl8IBx9aSE
I8xKstbincgr/STtWQF25mDy/cO3dC971bEDs2hfMGyVRyQO+O3QjjhB118ZbaA4
rj8PBQZsk+ztR7PWig9YSMWobetV3FEl7xecv1W5i1eDqdmyMKGp6KhIMwrBKXb3
sM8iENQhmKIzy5jz+r5rFVE/tZd9roRyoUN1xEwp77ohpb4s8cftNeIvpUBDuGll
ctKL+gFjWDkEQTXJkijJVD6mM0+nNVlPRBgQ5bC0arahpUJ3eALkM6rCZJwyF6AJ
WrEFCuikGm9NvZkpaaxdawfyYz/iqP2pcAzhRcdnvJO32tw5MCajc4Ds1kZInEBM
oYCBP5mJBqQXvXBMF4thJK4Q2YzyxPGKovKzZONVkXrj1AEwKCTmAhaX7wchqAHl
Up9Eqwrvk6nGIjrpCLF5
=U32m
-----END PGP SIGNATURE-----

--Signature=_Sat__22_Mar_2014_08_31_13_+1100_.WNSr_hM/LwqSnp5--
