From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: bad commit in the sunxi tree
Date: Tue, 25 Oct 2016 11:44:09 +0200
Message-ID: <20161025094409.hhf5rg3gbzaryjom@lukather>
References: <20161025092255.3f4f59e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kvfm6tmrkcas5pvn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161025092255.3f4f59e2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--kvfm6tmrkcas5pvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Oct 25, 2016 at 09:22:55AM +1100, Stephen Rothwell wrote:
> Hi Maxime,
>=20
> In today's sunxi tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunxi/fo=
r-next)
> I noticed that commit
>=20
>   3861b711f8b5 ("ARM: sun5i: chip: add a node for the w1 gpio controller")
>=20
> has no Signed-off-by from its committer.

Thanks, this has been fixed.

Just out of curiosity, what command do you run to catch this?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kvfm6tmrkcas5pvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDyllAAoJEBx+YmzsjxAgN44P/0dZBV8QqFuiF4UdrV75NwLl
H5EMQ1GpWz5R5H7e4e8Y3c7ARNtmdbI48F79kSXdh4wAPhG8um34pwe8Nn+cWhfL
UxI6m4YR/oH0O06Q/XP+iw9eaG9xrGOzb15zGfnuLQFRqkhk9KrsWEbV6M61kox7
Gs44vedSoW1qV96mkEwGNk6uMtQJn+F4SkZi4rSLaevn+VYcAwvmfTT8pNIBuWac
rUYeihkCkHDbaSvm+qnvdY47NtEguDpYY5tX2VQ422bCLne/yqhwDFApBdiI/7xj
VQrgsPwBaEQmP0xytoI/KlpUgOjYadn54zWhgwriP5KkiYJgN3/XD2UcQPj8EgYC
vdqmvW1PUaVXGsOBjig9VMx4he90S4mtoN00ZuDiOa2Sf26Z7EaJCLioAwmr3SZA
wOtdw/qzFIM/Vjs5JsnPjv2IkHx7mt3b+Yg7EInvMY6czAOEX/4Wa0tdhqzgJ4lN
IeMjY9xoO8JsleI1sn1dcvAcLHVDEGoDI2ob5io29WoiBN3prflMwsCPBpXBcuLH
LVjTZ5DbJ88mW7KXJeAkGQWmPNILSIAx4CgNxrtBn5a1Ga1NnfmsvIlNoPaNaCuI
4ekCrl2bO+++pzDFrvI5E4JOnzxc/9uDdMAoJRmWHCx1JQggpBA0MAG22Gwvz39a
zdLBRW+LHwy+DKipAuhQ
=mVeA
-----END PGP SIGNATURE-----

--kvfm6tmrkcas5pvn--
