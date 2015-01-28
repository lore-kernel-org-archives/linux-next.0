From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 28 Jan 2015 11:06:32 +0000
Message-ID: <20150128110632.GR21293@sirena.org.uk>
References: <20150128130047.2311c637@canb.auug.org.au>
 <20150128090935.GH14516@opensource.wolfsonmicro.com>
 <20150128095040.GI14516@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="79RLYUToM/4jl2vV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150128095040.GI14516@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org


--79RLYUToM/4jl2vV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 09:50:40AM +0000, Charles Keepax wrote:
> On Wed, Jan 28, 2015 at 09:09:35AM +0000, Charles Keepax wrote:

> > Very sorry guys my fault, not sure how that slipped through. Mark
> > do you want an incremental fix or shall I respin the two patches
> > in question?

> Ah... ok I think I just timed my patch very badly in relation to
> Lar's changes and it was building here so I failed to notice the
> error. I see you have fixed it in the merge are you happy to go
> with that solution?

It should be fixed for tomorrow I think - the zero day tester was quite
slow for some reason.

--79RLYUToM/4jl2vV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyMK3AAoJECTWi3JdVIfQTtwH+wesOWVOVHHRceeFmLExpWv+
5wGu9zwonNJ0CaTfWNSrs8MwV+7o4qa/sQWYThJuJAg4XS6VtvtMiVyuPsvymRRO
fJGvJph49n63VNm0WKLHWNRwAThLZU9rQldGdQPWNqs/v2bCbaseqpa10AsNEiZN
eX3N8cXH5uuWlvXGOVgmiKY7S+uahbjY0mXFYdytpAqtto+v2oMVHYk3w8rS1OhF
EdUuzVhsWaUxVL2yDsKf1wwI8Fea5ilNYRYRyAjXtj/1IreMq/9P9mdgthDPHSrz
jD7NkK/Kr2N4CMRSqLe6RZl0De52jofGf1NFALJlAZbPepbZvbQN0/27psfj/Hs=
=ozMb
-----END PGP SIGNATURE-----

--79RLYUToM/4jl2vV--
