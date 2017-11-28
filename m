From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: build failure after merge of the i2c tree
Date: Tue, 28 Nov 2017 10:53:17 +0100
Message-ID: <20171128095316.rv6z3yb62adedemp@ninjato>
References: <20171128110235.4e5e6a01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bn2nlmgx5svrkdje"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128110235.4e5e6a01@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--bn2nlmgx5svrkdje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> It is declared in include/linux/gpio/consumer.h which is not directly
> included by drivers/i2c/i2c-core-base.c ...
>=20
> I have used the i2c tree from next-20171127 for today.

Yes, thank you for the report! buildbot now reported this same problem
and Phil has already sent fixes which I just pushed out.

I think I should give such refactoring series an extra round of buildbot
by having them in a seperate branch for a while before I merge them into
for-next...

Thanks,

   Wolfram


--bn2nlmgx5svrkdje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlodMgwACgkQFA3kzBSg
KbYfJxAAqyWgNKp1tQ7uaZvAjngIJftG86RtbHMBuS3i7ca95429KYT6rdXyr5rJ
rjHgjYoN/E4V47k6jINypvxJfLqXvlRiaAgjSZBT2t5/ZJhbT4GTA5dld3DRmUud
+yCivyiwMu1l+tkWEcgePyyZGspHUjoa9f5Mb6+e5+aAeTqRIONsl5Je+R/Up4+1
HZuRF0K72uqlxRVaTNTC9wCmrOQjYjWLcEhes6frLHoPQsHyDeXJUXGXXEUZPsgj
NO93KwfPMc03CgvJNk7P5Da/aG3qdKJGfe48mb4ku3mdxxyL1vDBedCvgEfqogiJ
FxoxMSPLbfpJ/w8PCSzkKH4amEEdstvpoYfe+7VStNmOu7HwBlaiIECXMhLKLjS3
BNEbrN1zt1JFPjK5cIyTDA5re766vaG+bKxsIVAyn7FLJTuZxu22vzNWnt1rmdrI
tn+XKA9BLneSCRlLO+drThYgg2qT5jVyYABiwnT13E4b5SKxo1nvayA8i9FRyqHr
QPmuM7te9XwMHHrkQC4MulbEaRTI1bgkvo/SRAN4MdAfPXHeVDimTtBKZfqsbkWY
aTsgMwS+naWI79mdG4xB1WzUzyTAnhN1YU0tsYA505+xdepKeMCYmu45sG6Nfnch
1QsMqCdYrtwjCcEe9AQPUEz2o0XYnb2DCGkiIUkxikRCB4l3pFs=
=wq4U
-----END PGP SIGNATURE-----

--bn2nlmgx5svrkdje--
