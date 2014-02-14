From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mvebu_defconfig was renamed
Date: Fri, 14 Feb 2014 11:48:48 +1100
Message-ID: <20140214114848.d506c7a9947e3028b2aa203e@canb.auug.org.au>
References: <52FCE3E8.6080507@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__14_Feb_2014_11_48_48_+1100_JhVaRYdVpwt+KTcE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52334 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932AbaBNAsz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Feb 2014 19:48:55 -0500
In-Reply-To: <52FCE3E8.6080507@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

--Signature=_Fri__14_Feb_2014_11_48_48_+1100_JhVaRYdVpwt+KTcE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, 13 Feb 2014 10:25:28 -0500 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> This recent build failure:
>=20
> http://kisskb.ellerman.id.au/kisskb/target/16059/
>=20
> is caused by a defconfig being renamed:
>=20
> commit 7fc2def52fbf6cdfebf48c51ce8ec61202a1d4b9
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Mon Feb 10 19:19:59 2014 +0100
>=20
>     ARM: mvebu: rename mvebu_defconfig to mvebu_v7_defconfig
>=20
> so it will require a configuration change on your builders.

Thanks for the heads up.  Hopefully fixed now.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__14_Feb_2014_11_48_48_+1100_JhVaRYdVpwt+KTcE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS/Wf0AAoJEMDTa8Ir7ZwVEl8P/RhIlVvqwLyXHefpHuI6tnuQ
XBOUvWK+mo6ovtA5W9NQ+kRbHSdwx6PBRwS6O0XZOeNOb/AVGz5rAoC4aZuuaDZe
MUPMz7kucvPLsMc2YNvSGSjQM4SavSFG5XwMo+9BcmkVrMTJy226GcSbUqklMudn
KK3inPvH9SS3aBKvhONuCEjO0BNB/3Q1wROnDcJ2mntCERQCwsKTr2xsctE5Z1O9
vBnXvrK7pFSmohP67LRtfEp/6PFRljE3fXwrR4VmVprxiNKTRPpnS2VSrvYJOkfP
0LlIFhTi6Zlb+vJ/EfXRY9v2TuBjdm81DTZhNn0ULKdn/bDPQ0TejYtJ8mcP+OIg
04WNA+0MfoVaYUvXHVtROBvzHtwWGayxN4nUj+ajVtUy3OWkdFZ8QnO4o4GMi0v/
fZhPppEwNXPJ4oQWQRpSFdP2XsQUEIveSp2arfyhJK5W+naIp9NfaVISz66mpx3y
RilBkGyH7ZL3kjpKr3KXGkzoPACKdNEBe4W37yyaDY5OJEloLXmzYuxowDr8yq3h
RGiRgTMWrv8KA6mRiSKXqPEECaXh3auawrf8B4N+M9OzAz3OVWdBnombk7VwavH2
Iivy0/VIcftrN0+ysEqQUkBljlJhQYurA5Bq2znm3+oVOTkggFysmBvYdhM+mFWe
WDrQyMS36GogaXbkWpBm
=I03Q
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Feb_2014_11_48_48_+1100_JhVaRYdVpwt+KTcE--
