From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 6 Dec 2016 13:22:04 +0000
Message-ID: <20161206132204.i5fcrrjer52nr6rb@sirena.org.uk>
References: <20161206111459.77b05dc4@canb.auug.org.au>
 <87inqxc2lr.wl%kuninori.morimoto.gx@renesas.com>
 <20161206093745.gerksfd5gygxk6ym@sirena.org.uk>
 <20161206125538.GF25385@dell.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zibgllgo32hdep6n"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45762 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753072AbcLFOCw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2016 09:02:52 -0500
Content-Disposition: inline
In-Reply-To: <20161206125538.GF25385@dell.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--zibgllgo32hdep6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 06, 2016 at 12:55:38PM +0000, Lee Jones wrote:
> On Tue, 06 Dec 2016, Mark Brown wrote:
> > On Tue, Dec 06, 2016 at 12:41:15AM +0000, Kuninori Morimoto wrote:

> > > 	8ca9edc837932469b81b8b47ea43a074b6add970
> > > 	("mfd: davinci_voicecodec: Tidyup header difinitions")

> > Reverted.  Lee, there is actually a dependency here...

> No idea what you're talking about.

You were saying there were no dependencies for the ASoC bit of
Morimoto-san's cq9vc series.

> Are you going to allude to the patch you reverted?

The one Stephen identified.

> I assume you wish for me to pick it up?

Or if you could send me a pull request for the MFD bits.

--zibgllgo32hdep6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhGu3sACgkQJNaLcl1U
h9BurQf/UQr7zKjFSTc002oyyWIil/R7/93ypuyozf2oFIEknM9FMUHuwDcAnsLc
gOE2xd58NfrZts+VZsIEJPOZtVyGV6fB8XLDFv1ajCTNE4zm+j8F3p6ul3mRk6nZ
/IDnDkhOyQoQOZinVp/keHX4LNtkxmeU0IGTz5DBM6hccRLYXpmWbgdFatQBvhjf
Xpc5xPaVmbcAVWSvXGTqYxCid25P9UB02S8esQp4EJi92VXHDV/ovKQly0wkdVpg
8xEvr9l4+6yjoisKJ4RjvMT5hUySvN51tn0vstLiu4vfFX2zQ/sKrQ6kU6UNuXh1
pPQ76Sb8PrAHhzI3wGrBY9CGFpUtpw==
=kqpe
-----END PGP SIGNATURE-----

--zibgllgo32hdep6n--
