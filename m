From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warnings after merge of the regulator tree
Date: Mon, 28 Jul 2014 14:49:04 +0100
Message-ID: <20140728134904.GX17528@sirena.org.uk>
References: <20140728203233.26341abf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fgTtmruieKHQo6By"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140728203233.26341abf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-next.vger.kernel.org


--fgTtmruieKHQo6By
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 28, 2014 at 08:32:33PM +1000, Stephen Rothwell wrote:

> In file included from include/linux/regulator/machine.h:18:0,
>                  from drivers/acpi/bus.c:36:
> include/linux/regulator/consumer.h:468:23: warning: 'regulator_get_regmap' defined but not used [-Wunused-function]
>  static struct regmap *regulator_get_regmap(struct regulator *regulator)
>                        ^

Ugh, that should actually be fixed but apparently I forgot to rebuild my
-next branch before you picked it up.  Should be fine tomorrow anyway,
sorry.

--fgTtmruieKHQo6By
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT1lTMAAoJELSic+t+oim9dRUP/iruPhZQdlzGsqTT3tF3bL38
BN3v5kpk0ncTvunQ1Ls/aeFeLCyvWos1ZpT5DLoYopI4Xb16EqJiAjgvV0QDrO94
sMw4tuDWBWsA9GIEl4pnwqyMnmNTs4dc4duKpLM0JCmJHqvIuamuhYXuQ9fz+wyr
/j5s4qEQt8i3DG8hIEXVaOUXZqYO1A5EAZos/0vZFMQI3gXrRlSjz/6n97fgFlpH
z5vMnOo3fEqNd9GDpd0TT0P1kRJEq2BQnTJAj1OZhUDWFuMrdMYW9jIOLbUGY8FQ
FyNXN1etGTzk4CQ4FEYAT6/lAXCnuvFhf3IZYrx4SmcZxTc4M39bGSVp423lqe+2
Z3Ng3k1lxYOX9q9pbOuGpUdW7Y4iHYCQF3WHXb2dvbpoDwJ/HYT9B8Rq7W7Y8Ydm
F1syZQX4VKGfLuPCUnXiuDh1+hg1H3RbMloUBqzYnGNQQX6nqFCwQ9OwKBYc/f0r
1c/+F6vU04JUOnm1fpEDlxFs1iJl+q/a8pgHcGp1xRknQ5vV0uHlSVRUSsdv51GU
keuNL4VBmG7uVV4iR4LYxnwyX96xdRsTVMcTDDn9TMeoIkbd2O8li0/ZgnJcauBt
ZPB27tl1bamDFgj0KmpQAMKcD7Wi6mA+y/nhu5Slf2gVI8mWCFqr4Q8c7cCNlWiN
Fk8Txq3E0aikJAf/VSCm
=QFjd
-----END PGP SIGNATURE-----

--fgTtmruieKHQo6By--
