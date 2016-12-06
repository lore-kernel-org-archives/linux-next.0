From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 6 Dec 2016 09:37:45 +0000
Message-ID: <20161206093745.gerksfd5gygxk6ym@sirena.org.uk>
References: <20161206111459.77b05dc4@canb.auug.org.au>
 <87inqxc2lr.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6r4yaac2p6nqvgb3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40640 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbcLFKFV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2016 05:05:21 -0500
Content-Disposition: inline
In-Reply-To: <87inqxc2lr.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org


--6r4yaac2p6nqvgb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 12:41:15AM +0000, Kuninori Morimoto wrote:
> > In file included from sound/soc/codecs/cq93vc.c:32:0:
> > include/linux/mfd/davinci_voicecodec.h:31:27: fatal error: mach/hardwar=
e.h: No such file or directory
> >=20

> As I indicated on cover letter, this patch is based on

> 	git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git :: for-mfd-next

> 	Especially this commit

> 	8ca9edc837932469b81b8b47ea43a074b6add970
> 	("mfd: davinci_voicecodec: Tidyup header difinitions")

Reverted.  Lee, there is actually a dependency here...

--6r4yaac2p6nqvgb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhGhugACgkQJNaLcl1U
h9Dahgf+JLtJmK2G57YkyBoTgXTrpCl3obKlH3xLfIrVp4fSZiUantVv0ju9jBMB
2xpJ/CgpWqBAvsqOCReZWZ/l2KmGYjjWAPGs80+fg03QVEX6xPk50UmydZl1cwM5
QKAMlh/jZFxDAcD9TLzXy/ye1P6jrXsN7t9bvXSdJQ5fkZvqPv4iWaydtDTQissM
6rTbavae6Rg9Xe2ltMeMoqLSv5Fnh/aE39xCCjCH+l9Fe5x4/0rI4Wq4WaRapUMh
ZE0BaUR9XTxHawJBGhRHNCPIrdKdYB+Q4ew6vvtGflt5GOFCjWxsKERe3/PrshWo
AZwlLgkaXTgOXYdMnG+xSKrup/MEWQ==
=vS7l
-----END PGP SIGNATURE-----

--6r4yaac2p6nqvgb3--
