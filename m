From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] modules: elide param_lock if !CONFIG_SYSFS
Date: Fri, 26 Jun 2015 08:39:59 +1000
Message-ID: <20150626083959.0407ea3c@canb.auug.org.au>
References: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com>
	<1435237448-13684-1-git-send-email-ddstreet@ieee.org>
	<87616bsd02.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/34kzTDYzM/FFC7YUx1r.so_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55404 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750993AbbFYWkG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2015 18:40:06 -0400
In-Reply-To: <87616bsd02.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dan Streetman <ddstreet@ieee.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/34kzTDYzM/FFC7YUx1r.so_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Fri, 26 Jun 2015 06:48:37 +0930 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> Dan Streetman <ddstreet@ieee.org> writes:
> > Only include the built-in and per-module param_lock, and corresponding
> > lock/unlock functions, if sysfs is enabled.  If there is no sysfs there
> > is no need for locking kernel params.
> >
> > This fixes a build break when CONFIG_SYSFS is not enabled, introduced
> > by commit b51d23e.
>=20
> This doesn't even come close to applying to my tree?

That's because (as Dan noted) there was another fix patch in the tree
he was fixing ...

> I've fixed it like so, and tested it compiles both with and without
> SYSFS.
>=20
> Subject: param: fix module param locks when !CONFIG_SYSFS.
>=20
> As Dan Streetman points out, the entire point of locking for is to
> stop sysfs accesses, so they're elided entirely in the !SYSFS case.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Except the commit you added to the modules tree has no signed off by or
commentary :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/34kzTDYzM/FFC7YUx1r.so_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjINEAAoJEMDTa8Ir7ZwVp5sP/1F+rFt2UHl6QanAtM7jYprf
V7Dcaq4TDaDawl9fruQhJI5n0TpmOD/VCfRJ+H1pg+OTw6ANXhQCHOz3Wzz8+S78
TEOMjkipA2vvcGRGiwUaB4Uo/aQgfcnqwyTbyl3UGeCxU6QtmRxogPunBUWbhpTK
K6zRleoDB7yxRyDMwgxDQyKBH5pI3uka3MDHd6e3sQKZHGenFK4coyQ+nj9oNDcS
Vf8enQ9FzVKq+BVFUAapnckZ4LmVPuHcrF1qISwb7TMjWTQNLy5OAxTerm3gvYX3
EIpI7plraIV98i2HeSnS1AvcusyXjMpxYm0eRTzU10JnEINosjgru1uVSkpP84Th
MCbR774iMSOxCm321mP+nFfVsKt+ioDeo0I6Bm8y8VlEsTZ+4OC8Ub+sAHtTjlyU
hPgkgb+pDBGT6veUS0n2Ly2kATI50V9NNkFunBzJti/jhEpAmgyThYlfT3D3l8d2
bykYNwTcKxnrKJahJrhZc7pTm5NRagY+JImHn41y1yJtm2ObXVXbRUB2HFZopaNA
KpUTbN09xMtHfXOq7HKFiVJEU2cdWqCF9VwZ5tYy2oTzNsBQ7LZspyRRwvMewC4P
TwycXz8Tcxj6St3ExzemZluTC6n+uV1ee+hRvX0M+oUdRfpuu2RbqOLKbi32uPw+
8w+U7O7KZPAcswIHaeK+
=LYnA
-----END PGP SIGNATURE-----

--Sig_/34kzTDYzM/FFC7YUx1r.so_--
