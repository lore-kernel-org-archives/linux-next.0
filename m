From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20161205 build: 3 failures 4 warnings (next-20161205)
Date: Mon, 5 Dec 2016 17:20:55 +0000
Message-ID: <20161205172055.nfid7v4vu3v7ik3q@sirena.org.uk>
References: <E1cDo86-0008IX-9W@optimist>
 <20161205112043.pyzcbhtu7bklioas@sirena.org.uk>
 <7b3daf13-dbab-5acf-cd5f-2414141500b3@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjm6og33fhdwdojc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47998 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbcLERVJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2016 12:21:09 -0500
Content-Disposition: inline
In-Reply-To: <7b3daf13-dbab-5acf-cd5f-2414141500b3@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--bjm6og33fhdwdojc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 05, 2016 at 03:44:30PM +0000, Marc Zyngier wrote:

> Old and broken gas. I have a workaround stashed there:

> http://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/commit/?h=arm64/standalone.h&id=559f97365362ed9e96f594200020379df46630d8

> At least binutils 2.24 and 2.25 are affected, while 2.27 is not.

Not that old - this is the Linaro 2015.10 toolchain which wasn't super
new but not exactly from the mists of time either.  Anyway, I updated to
2016.11 (GCC 6.2.1, GAS 2.27)...  let's see what the fallout is like.

--bjm6og33fhdwdojc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhFofYACgkQJNaLcl1U
h9Answf/SrzIiAY3KavPWV2XTl0Qnl7hBn7cIfvB+TSAurQoxbyLewJ34NUSly6F
nfRjA8hJznsNM9VguH0xa9YBCfYJ3+1KdThqPhDCA/Rg+Zh05DYnv7bY7zKD+ttE
TAufuG4exR+eeWoHn22s9mb9N/X/UoEENyIdkuNcaE/mjEC3nH9YCBvsrO3LVUDb
aHEUKzSlTbnmMwK9/sNxQTUVFL+aSZSZBmT7dWIE9xGifh2aBnPfE33XnZIDw9WV
JosWq6PUfQEfgVFXKKwnlPcVFmzAaR3HgEPUI1ZnzOYcjSMMJwuS4piuuEYBWTbS
QZgeguXDhm6rGu7YxkczpXxbI3LGFw==
=z0VQ
-----END PGP SIGNATURE-----

--bjm6og33fhdwdojc--
