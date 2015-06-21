From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the bluetooth
 tree
Date: Sun, 21 Jun 2015 10:40:59 +1000
Message-ID: <20150621104059.26b76cbf@canb.auug.org.au>
References: <20150620162224.24da2d9f@canb.auug.org.au>
	<20150621003331.GA26768@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SnWZ/KhZP8VlO6r0lDhBjL_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51914 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752871AbbFUAlH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 20:41:07 -0400
In-Reply-To: <20150621003331.GA26768@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Vincent <simon.vincent@xsilon.com>, Marcel Holtmann <marcel@holtmann.org>

--Sig_/SnWZ/KhZP8VlO6r0lDhBjL_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Sun, 21 Jun 2015 08:33:32 +0800 Herbert Xu <herbert@gondor.apana.org.au>=
 wrote:
>
> Actually I think that's all you need to do since the crypto tree
> version no longer has the bug in question.

Ah, excellent.  Thanks for checking.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/SnWZ/KhZP8VlO6r0lDhBjL_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhgggAAoJEMDTa8Ir7ZwV/ooP/0lpFPQM/Rz3maYSleBKFtgS
/8BbWkeqr5yOkVz06huuoz9XING88bhczyu3g2tohpfGXlO7ogRJ3N0KyZKYbYYl
7C1weRmv7hMD5OGZFb/FGeOY/3KpRDeqUdRYKoQrJjldmA+Hjx5ARXbXZTKxDkeN
A8SHAW+OvtXk6fl61mXhj0dGEyQ3X44CLSIQ+DOzBNjcKqf2pgeJ8F3EaIdJVCB2
PddEjosIi/jm6GmRCDTCOByqLM8ydi4TR89yGhZLcJACteIBfLHX8vS120p6mkfn
bHV6agMAxgMwty47gPEOUpIRgcDGbaPRoicmBxyrLxfW//mfv21vzO6NdTEBVJCR
DUjyh1r1MB+tmGFmQawrxWb6/OQZstttUWMAxWD2aoAHHBBr3teowMsns8s9ovjs
Jd6/khucfPdzW/rs+AOIq3NGn0rfzFBDAYBR9L8y+peOPLaC+t+NXvuKm0iui0xb
Ji+HHeELafeGw13xaCavmsZZgIKX64mTQUfynrFqKo19vz/bKf+hZnd82qJrnxib
MEFGoIG3gjn4T/G4Q6m1/8IYqSZ+6o/koLIGpYsc12MB3dTbsyGLva7dEorzH55/
mjiePo5A2SbZEOxOoGOLqW59ZmYbMepewXcp/lW4L92C+o5/mrjBZkQGWTjQLQ45
xaLQLZpjTa6LrPCsl02e
=N3Kw
-----END PGP SIGNATURE-----

--Sig_/SnWZ/KhZP8VlO6r0lDhBjL_--
