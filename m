From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 18 Apr 2018 15:49:08 +0100
Message-ID: <20180418144908.GE10061@sirena.org.uk>
References: <20180418095113.21c84c83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180418095113.21c84c83@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 18, 2018 at 09:51:13AM +1000, Stephen Rothwell wrote:

> Caused by commit

>   81e9b0a07889 ("ASoC: topology: Give more data to clients via callbacks")

> I have used the sound-aoc tree from next-20180416 again today.

Ugh, reverted that and the following commit which depends on it.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrXWuMACgkQJNaLcl1U
h9AnRgf7B0ogG9V8ubU5Jn6zvsNDUSyuJKHKJRGItycMv7zcXc7gjL7N06TbOW0V
L/WWo0+g5ncADhLIPsHBOF1EbTK/5CIHJZARIXSQhSTgIggN4tJcUdOu+SijOI6+
gNABrP1z/vI8ODYcBkoQK3qoIqLbaXq/T5qTk/jux/l8VdHEmGtaTRUOfYdl/T1i
pbS4aBPiZdPQ8mU9zotHxc4vNhTeW3sf4/lCYSOOG50eMU3WRJgf44wQzzMalXfP
lBqTMmyFDAVzuExsD97QtIgvMXXdCSsuAGiFjYQgHC2Bca3XIFnij5sQp7jblU+m
tK0Mps5ck21faErjn4x1gNRxIUdgPQ==
=BSMR
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
