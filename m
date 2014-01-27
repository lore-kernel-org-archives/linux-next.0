From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jan 24
Date: Tue, 28 Jan 2014 10:28:33 +1100
Message-ID: <20140128102833.188b0ecb3d0d627b3d31ea30@canb.auug.org.au>
References: <20140124154002.6020ae0892c30c82c77d7adf@canb.auug.org.au>
	<20140127174756.GA21205@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__28_Jan_2014_10_28_33_+1100_.I86aqEt8v_am0Le"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:49573 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753849AbaA0X2k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jan 2014 18:28:40 -0500
In-Reply-To: <20140127174756.GA21205@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linus.walleij@linaro.org

--Signature=_Tue__28_Jan_2014_10_28_33_+1100_.I86aqEt8v_am0Le
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 27 Jan 2014 12:47:57 -0500 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> While looking over some of the other fails, I noticed arm
> shark_defconfig build failure:
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/10510182/
>=20
> We can simply drop this build entirely, due to this commit:
>=20
>    commit 136dfa5edae3207422a8b93347eb79e92e07cdfa
>    Author: Linus Walleij <linus.walleij@linaro.org>
>    Date:   Tue Sep 3 11:32:24 2013 +0200
>=20
>        ARM: delete mach-shark
>=20
> The last passing build was Sept 26, so apologies if this has been
> reported since then.

Thanks for pointing it out - I have removed the build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__28_Jan_2014_10_28_33_+1100_.I86aqEt8v_am0Le
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS5uumAAoJEMDTa8Ir7ZwV8HcP/iqi0/0HvjOhQiuthpqjhOXD
jq4fJExyIrWB34FySrfC8liE1+Oa8voctOtCVE8ZW6CFP8YnNkYh26sESeTq2hEE
A42vYVNE5cj0y5tuGdE9XDKHX5akwhzuABNU3R/aSVNhKIrNuXF0IgOKnT7q6vCw
taJpZeu89kpcF2HUCiJbB0R6i08kObfmAkd3SJcH3OQEK4VeOnoiMgRcCZuTcYR6
yAz9TsstlsZoTL2dBb6S70mkFZqjoLFUeGURaj9kgfYpkMOfuDYogaFuU5OEitg2
Yf5TDKpCuyrUJKzzQZbzgqZrE17hBiB5b+Xa+HkmDMtTLEHYja3SMARywNjz5gC4
fRoVfTXPz6zltpStrKJqTtXyzNOI0NVLOmZQ3uBmX09cdPArUaPRHS2hVV24SRDZ
KuwMYX2+9492RMT7QWMLm3ZWiWqNSFS+yyuup8Q0pPjSJwBx1JkYtGaMl6ZR8Ot2
+x3azaB/hxwZLchmFS8pK+ncufqXMjLyMfPNAeeJMWnVr4lFg0WPqGg0Pp3tgYc9
XCcHnD7ThJFuCBhnbXdGO613mQSGr6Zf6qR/D+2TcyPwUwa3Rk2ZzCUUe2g+ideP
mbsrxZDcC2LPtqiyfmM2R4Utr++SajO4eZpuMg5AYVQN8Rq+9lCaeF93l58WPjsh
zSu24tJI6WXt+TLdpPf5
=tgtV
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Jan_2014_10_28_33_+1100_.I86aqEt8v_am0Le--
