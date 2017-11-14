From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20171114 build: 4 failures 5 warnings (next-20171114)
Date: Tue, 14 Nov 2017 11:18:48 +0000
Message-ID: <20171114111848.s3os77xlwuf7mxkx@sirena.org.uk>
References: <E1eEWh8-0005hK-AY@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3lrzyhlohkt3emdm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41552 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751836AbdKNLS4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2017 06:18:56 -0500
Content-Disposition: inline
In-Reply-To: <E1eEWh8-0005hK-AY@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mehmet Kayaalp <mkayaalp@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--3lrzyhlohkt3emdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 08:35:46AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build on arm and arm64 due to:

> 	arm64-allmodconfig
> ../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or =
directory
>=20
> 	arm-allmodconfig
> ../scripts/insert-sys-cert.c:28:18: fatal error: gelf.h: No such file or =
directory

which is due to 2dbfb74badfd3a0178 (KEYS: Add ELF class-independent
certificate insertion support) adding a requirement for libelf rather
suddenly.  I've installed that on the build box but it's a bit
surprising to see this appear after the merge window has opened.

--3lrzyhlohkt3emdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloK0RcACgkQJNaLcl1U
h9D6LQgAgZojHAP5bzXiigZpwtB+Bg/5WYB2iu3q6Mg392Y1dL+ywihXcaWCauxl
A/kUoulmIAP0s7IIG4Ro+pSGjnXIhZh9z9HukQwE5dYD46je4h+YLVLs9kgdbdgB
qbmVmPKfzK1ZVlp73YnKqI5uuEKFH5IAim0ifxKeCQ2ROF+2uO68BY1HTLEakTQH
aRvIFZ7xYI0wj2uOQ3oz7ehrVgoFKQFTF7Xj3Qz/qzRmTiNGPGnXdiHfBK+fyfUj
MftZJiUk3Yh+bPf9j0uZGwZmcah8MefKmDc80tKzyKaopTsAuZF20Rluobqvu3KI
1pG/dhY5TDDUzoagLh35JBdnenfjkQ==
=Ujpc
-----END PGP SIGNATURE-----

--3lrzyhlohkt3emdm--
