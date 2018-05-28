From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for May 24
Date: Mon, 28 May 2018 12:04:35 +0100
Message-ID: <20180528110435.GA6542@sirena.org.uk>
References: <20180525173025.GO4828@sirena.org.uk>
 <20180527184639.GD1564@sirena.org.uk>
 <CAK8P3a2vmbxYmMqTYb0kHoB3uTcWi_=hL=Wunfw6nqE0NGr+QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a2vmbxYmMqTYb0kHoB3uTcWi_=hL=Wunfw6nqE0NGr+QA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 28, 2018 at 11:08:22AM +0200, Arnd Bergmann wrote:

> One possible reason for slowdown on ARM allmodconfig might be the additio=
n of
> KCOV, though that is only enabled in mmotm at the end of your builds.

It's not that - it's slow on just the main builds (x86 allmodconfig, arm
multi_v7_defconfig and arm64 defconfig when I'm doing it).  I think it's
due to a combination of some degree of natural growth in build size and
the builds now all being forked off at once rather than being run
sequentially - the system ends up either context thrashing at the start
of the build or using too few cores for the allmodconfig but I was too
busy running the builds to experiment much. =20

My system isn't nearly so fancy as Stephen's which probably doesn't help
here, I do keep thinking about upgrading so there's a good chance that
next time I try I'll have done so.

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsL4kMACgkQJNaLcl1U
h9A9gwf+IteG36TZOPXJaHT7S6Gn+XENXkC5i26K9islcaQROR7DA04R19dWrpcX
4g8g5hDXwHRzS6QpXwFL2Nx4RD3ktVlOniN8pT9ETGLU9l2V9tAKswPFDRS2j9Yq
aBU2329dD09oWzBt0yKUCePn64vMcH3zUFOeml2gQ2aeSRFGnJXlYdhIJzL9yKoy
cpBleRb88ZCbu0CBHDjZlYaUdc+LAxgpGe3zb3CYWdpdpTI6RyDJP29yqY1XMeBq
OO3Uy2lRRzq1DAcap5RSLzi4IPaLxnqyiSxduoEM9cvnizDu2FTIxKGrLkH4eE4U
/ju4TGQlQUhyKBbLClSnQutFcLB5wQ==
=Avbj
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
